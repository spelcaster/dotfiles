local jdtls = require('jdtls')

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

local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if ok_cmp then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

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
    },
  },

  init_options = {
    bundles = {},
  },
}

vim.keymap.set('n', '<leader>jo', function()
  require('jdtls').organize_imports()
end, { buffer = true, desc = 'Java organize imports' })

vim.keymap.set('n', '<leader>jv', function()
  require('jdtls').extract_variable()
end, { buffer = true, desc = 'Java extract variable' })

vim.keymap.set('v', '<leader>jm', function()
  require('jdtls').extract_method(true)
end, { buffer = true, desc = 'Java extract method' })

jdtls.start_or_attach(config)
