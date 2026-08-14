vim.pack.add({
  { src = 'https://github.com/mfussenegger/nvim-jdtls' },
})

local JavaLSP = {}

function JavaLSP.setup()
  local jdtls = require('jdtls')
  
  local function java_move_file()
      local bufnr = vim.api.nvim_get_current_buf()
  
      local client = vim.lsp.get_clients({
          bufnr = bufnr,
          name = "jdtls",
      })[1]
  
      if not client then
          vim.notify("JDTLS is not attached", vim.log.levels.ERROR)
          return
      end
  
      local uri = vim.uri_from_bufnr(bufnr)
  
      client:request("java/getMoveDestinations", {
          moveKind = "moveResource",
          sourceUris = { uri },
          params = vim.NIL,
      }, function(err, result)
          if err then
              vim.notify(err.message, vim.log.levels.ERROR)
              return
          end
  
          if result == nil or result.destinations == nil or #result.destinations == 0 then
              vim.notify("No destination packages found", vim.log.levels.WARN)
              return
          end
  
          local destinations = vim.tbl_filter(function(destination)
              return not destination.isDefaultPackage
          end, result.destinations)
  
          vim.ui.select(destinations, {
              prompt = "Move Java file to package:",
              format_item = function(destination)
                  return string.format(
                      "%s » %s",
                      destination.project,
                      destination.displayName
                  )
              end,
          }, function(destination)
              if not destination then
                  return
              end
  
              client:request("java/move", {
                  moveKind = "moveResource",
                  sourceUris = { uri },
                  destination = destination,
                  updateReferences = true,
              }, function(move_err, move_result)
                  if move_err then
                      vim.notify(move_err.message, vim.log.levels.ERROR)
                      return
                  end
  
                  if not move_result then
                      return
                  end
  
                  if move_result.errorMessage then
                      vim.notify(move_result.errorMessage, vim.log.levels.ERROR)
                      return
                  end
  
                  if move_result.edit then
                      vim.lsp.util.apply_workspace_edit(
                          move_result.edit,
                          client.offset_encoding
                      )
                  end
              end, bufnr)
          end)
      end, bufnr)
  end
  
  local root_markers = {
    '.git',
    'mvnw',
    'gradlew',
    'pom.xml',
    'build.gradle',
    'build.gradle.kts',
  }
  
  local root_dir = require('jdtls.setup').find_root(root_markers)
  
  if root_dir == nil or root_dir == '' then
    return
  end
  
  local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
  local workspace_dir = vim.fn.stdpath('data') .. '/jdtls-workspace/' .. project_name
  
  local capabilities = require('blink.cmp').get_lsp_capabilities()
  
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  }
  
  local config = {
    cmd = {
      'jdtls',
      '-data',
      workspace_dir,
      -- JVM memory limit
      '-Xmx1G',
    },
  
    root_dir = root_dir,
  
    capabilities = capabilities,
  
    settings = {
      java = {
        configuration = {
          updateBuildConfiguration = 'interactive',
        },
        import = {
          gradle = {
            enabled = true,
          },
          maven = {
            enabled = true,
          },
        },
        format = {
          enabled = true,
        },
        completion = {
          importOrder = {
            'java',
            'javax',
            'com',
            'org',
          }
        },
        signatureHelp = {
          enabled = true,
        },
      },
    },
  
    init_options = {
      bundles = {},
    },
  }
  
  jdtls.start_or_attach(config)
  
  vim.keymap.set("n", "<leader>lum", function()
    vim.lsp.buf.code_action({
      filter = function(action)
        return action.title:lower():find("override", 1, true) ~= nil
      end,
      apply = true,
    })
  end, {
    desc = "Java: Add unimplemented methods",
  })
  
  vim.keymap.set('n', '<leader>jo', function()
    require('jdtls').organize_imports()
  end, { buffer = true, desc = 'Java organize imports' })
  
  vim.keymap.set('n', '<leader>jv', function()
    require('jdtls').extract_variable()
  end, { buffer = true, desc = 'Java extract variable' })
  
  vim.keymap.set('v', '<leader>jx', function()
    require('jdtls').extract_method()
  end, { buffer = true, desc = 'Java extract method' })
  
  vim.keymap.set("n", "<leader>jm", java_move_file, {
      buffer = true,
      desc = "Java: Move file",
  })
end

return JavaLSP
