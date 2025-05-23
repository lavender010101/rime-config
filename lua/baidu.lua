local json = require("json")
--  local http = require("simplehttp")
-- http.TIMEOUT = 0.5

local function make_url(input, bg, ed)
	return "https://olime.baidu.com/py?input="
		.. input
		.. "&inputtype=py&bg="
		.. bg
		.. "&ed="
		.. ed
		.. "&result=hanzi&resultcoding=utf-8&ch_en=0&clientinfo=web&version=1"
end
-- 封装 curl 发送网络请求
local function http_get(url)
	local handle = io.popen("curl -m 0.5 -s '" .. url .. "'")
	local result = handle:read("*a")
	handle:close()
	return result
end

local function translator(input, seg)
	local url = make_url(input, 0, 5)
	-- local reply = http.request(url)
	-- 更换一下
	local reply = http_get(url)
	local _, j = pcall(json.decode, reply)
	if j.status == "T" and j.result and j.result[1] then
		for i, v in ipairs(j.result[1]) do
			local c = Candidate("simple", seg.start, seg.start + v[2], v[1], "(百度)")
			c.quality = 2
			if string.gsub(v[3].pinyin, "'", "") == string.sub(input, 1, v[2]) then
				c.preedit = string.gsub(v[3].pinyin, "'", " ")
			end
			yield(c)
		end
	end
end

return translator
