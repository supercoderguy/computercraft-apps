term.setPaletteColor(colors.lightGray, 0xECECEC) -- mac-ish grey
term.setPaletteColor(colors.gray, 0x3A3A3C)
local w, h = term.getSize()
local dock = { "Finder", "Shell", "Edit" }

local function draw()
  term.setBackgroundColor(colors.cyan) term.clear()
  term.setCursorPos(1, 1) term.setBackgroundColor(colors.lightGray)
  term.setTextColor(colors.black) term.clearLine()
  write(" @ Finder  File  Edit  View")
  local t = textutils.formatTime(os.time(), false)
  term.setCursorPos(w - #t, 1) write(t)
  term.setCursorPos(1, h) term.setBackgroundColor(colors.gray) term.clearLine()
  term.setTextColor(colors.white)
  term.setCursorPos(math.floor(w / 2 - 10), h) write(" " .. table.concat(dock, " | ") .. " ")
end

while true do draw() os.startTimer(1)
  local e = { os.pullEvent() } if e[1] == "key" and e[2] == keys.q then break end
end