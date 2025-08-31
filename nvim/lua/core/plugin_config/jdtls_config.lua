-- =================================================================
-- ==           CUSTOM JAVA LSP (JDTLS) CONFIGURATION           ==
-- =================================================================
-- This file is adapted from the reference configuration.
-- It provides the detailed setup required to run the jdtls server.
-- =================================================================

local M = {}

function M.setup()
    -- Find the project root. `nvim-jdtls` comes with a helper for this.
    -- It will look for common Java project markers like .git, mvnw, or gradlew.
    local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" })
    if root_dir == '' then
        return
    end

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = "/home/don/java-lsp-data/jdtls-workspace/" .. project_name

    local os_name = vim.loop.os_uname().sysname

    -- =================================================================
    -- ==                        IMPORTANT!                           ==
    -- =================================================================
    -- This configuration points to a specific .jar file that mason downloads.
    -- The version number in the file name might change when `jdtls` is updated.
    -- If you update `jdtls` and it stops working, you will likely need to
    -- update the version in the `org.eclipse.equinox.launcher_...` line below.
    --
    -- You can find the correct name by running this command in your shell:
    --   ls ~/.local/share/nvim/mason/packages/jdtls/plugins/
    -- =================================================================
    local config = {
        cmd = {
            -- "java",
            "/usr/lib/jvm/java-21-openjdk-amd64",
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-Xmx1g",
            "--add-modules=ALL-SYSTEM",
            "--add-opens", "java.base/java.util=ALL-UNNAMED",
            "--add-opens", "java.base/java.lang=ALL-UNNAMED",
            "-jar",
            -- "/home/don/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar",
            "/home/don/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar",
            "-configuration",
            "/home/don/.local/share/nvim/mason/packages/jdtls/config_linux",
            -- "/home/don/.local/share/nvim/mason/packages/jdtls/config_" .. (os_name == "Windows_NT" and "win" or os_name == "Linux" and "linux" or "mac"),
            "-data",
            workspace_dir,
        },

        root_dir = root_dir,

        settings = {
            java = {},
        },

        init_options = {
            bundles = {},
        },
    }

    -- Start the client, or attach to an existing one
    require("jdtls").start_or_attach(config)
end
return M
