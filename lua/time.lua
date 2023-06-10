--[[
time_translator: 将 `time` 翻译为当前时间
--]]

local function translator(input, seg)
   if (input == "time") then
	  yield(Candidate("time", seg.start, seg._end, os.date("%I:%M %p"), ""))
      yield(Candidate("time", seg.start, seg._end, os.date("%H:%M"), ""))
	  yield(Candidate("time", seg.start, seg._end, os.date("%I:%M:%S %p"), ""))
	  yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), ""))
      yield(Candidate("time", seg.start, seg._end, os.date("%H时%M分"), ""))
      yield(Candidate("time", seg.start, seg._end, os.date("%H时%M分%S秒"), ""))
   end
end

return translator
