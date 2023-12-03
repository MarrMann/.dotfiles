local dap = require("dap")
dap.adapters.netcoredbg = {
  type = "executable",
  command = "/usr/local/bin/netcoredbg/netcoredbg",
  args = { "--interpreter=vscode" },
}
dap.configurations.cs = {
  {
    type = "netcoredbg",
    request = "launch",
    name = "Launch - netcoredbg",
    program = function()
      return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
    end,
  },
  {
    request = "attach",
    name = "Attach to process",
    type = "netcoredbg",
    processId = require("dap.utils").pick_process,
  },
}
