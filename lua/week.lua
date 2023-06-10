--lua语言中的注释用“--”

-- local weekday_en_simp = {["0"]="Sun", ["1"]="Mon", ["2"]="Tue", ["3"]="Wed", ["4"]="Thu", ["5"]="Fri", ["6"]="Sat"}
-- local weekday_en_full = {["0"]="Sunday", ["1"]="Monday", ["2"]="Tuesday", ["3"]="Wednesday", ["4"]="Thursday", ["5"]="Friday", ["6"]="Saturday"}

local weekday_cn_off = {["0"]="星期日", ["1"]="星期一", ["2"]="星期二", ["3"]="星期三", ["4"]="星期四", ["5"]="星期五", ["6"]="星期六"}
local weekday_cn_simp = {["0"]="周日", ["1"]="周一", ["2"]="周二", ["3"]="周三", ["4"]="周四", ["5"]="周五", ["6"]="周六"}

local weekday_cn_hk = {["0"]="礼拜日", ["1"]="礼拜一", ["2"]="礼拜二", ["3"]="礼拜三", ["4"]="礼拜四", ["5"]="礼拜五", ["6"]="礼拜六"}

function translator(input, seg)
  if (input == "week") then
    yield(Candidate("week", seg.start, seg._end, weekday_cn_off[os.date("%w")],""))
	-- yield(Candidate("week", seg.start, seg._end, weekday_en_simp[os.date("%w")],""))
	-- yield(Candidate("week", seg.start, seg._end, weekday_en_full[os.date("%w")],""))
    yield(Candidate("week", seg.start, seg._end, os.date("%a"),""))
    yield(Candidate("week", seg.start, seg._end, os.date("%A"),""))
    yield(Candidate("week", seg.start, seg._end, weekday_cn_simp[os.date("%w")],""))
    yield(Candidate("week", seg.start, seg._end, weekday_cn_hk[os.date("%w")],""))
  end
end
return translator
