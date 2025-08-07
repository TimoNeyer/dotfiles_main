-----------------------------
-- Vim command definitions
-----------------------------

-- Copy or write a random string
vim.api.nvim_create_user_command("Random", function(opts)
  local args = opts.fargs
  local copy = false
  local length = 32

  for _, arg in ipairs(args) do
    if arg == "copy=true" then
      copy = true
    elseif arg:match("^%d+$") then
      length = tonumber(arg) or 32
    end
  end

  local handle = io.popen("tr -dc '[:graph:]' < /dev/urandom | head -c " .. length)
  if not handle then
    print("Unable to read /dev/urandom")
    return
  end
  local output = handle:read("*a"):gsub("%s+", ""):sub(1, length)
  handle:close()

  if copy then
    vim.fn.setreg("+", output)
    print("Copied to clipboard: " .. output)
  else
    vim.api.nvim_put({ output }, "c", true, true)
  end
end, {
  nargs = "*",
  complete = function(_, line)
    return { "copy=true", "copy=false", "16", "32", "64" }
  end,
})
