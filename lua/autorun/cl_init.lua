--[Cold AntiScriptHook by Alex Snowrun; ver 2.28]--
local game_GetIPAddress = game.GetIPAddress
local file_Find = file.Find
local string_Replace = string.Replace
local RunString = RunString
local file_IsDir = file.IsDir
local file_Exists = file.Exists
local include = include
local pairs = pairs

_SCRIPT = nil
_SOURCE = nil
_SCARPT = nil -- Has been made after "f*ckn**ger" modification from original scripthook
_STMPTE = nil -- Has been made after "f*ckn**ger" modification from original scripthook

local dirwhitelist = {"_CommonRedist", "bin", "garrysmod", "platform", "sourceengine",}
local files, directories = file_Find( "*", "BASE_PATH" )
local shook = nil
local stshook = nil
local fsh, drs = nil

timer.Create("#$NdBIC4vKV234cbd4993//.--DG", 0.2, 4, function() -- Unreadable because hackers can stop it, but you need to rename it!!! (It'is very important: Make an unique name of the timer!) 
if #directories ~= #dirwhitelist then

	for k, v in pairs(directories) do -- Looking for malicious folder
		if not table.HasValue(dirwhitelist, v) then
			shook = v
			fsh, drs = file_Find(shook.."/*.lua", "BASE_PATH")
			fsh = fsh[1]
			if file_IsDir(shook.."/"..string_Replace( game_GetIPAddress(), ":", "-" ) .. "/", "BASE_PATH") or fsh ~= nil then
				stshook = shook.."/"..string_Replace( game_GetIPAddress(), ":", "-" ) .. "/"
			end
		end
	end


	local function FindFiles(path) -- Recursive function for rewriting files
		if stshook ~= nil then	
			local files, folders = file_Find( stshook .. path .."*", "BASE_PATH" )
			if files == nil or folders == nil then return end
			for k, v in pairs( files ) do
				RunString( "--Do not steal, stupid skid! [ColdPlayRP, AntilohAC; all rights reserved]--", path .. v, false ) -- Rewriting files (skid - aka scriptkiddie)
			end
			for k, v in  pairs( folders ) do
				FindFiles( path .. v .. "/" ) -- continue recursively
			end
		end
	end

	timer.Simple(2, function() -- I love timers))
		for it = 1, 1336 do  -- Maybe can stop some scripthook (1336 is because about 1000 clientside files on my server(probably))
			if fsh ~= nil then
				RunString( [[if debug.getinfo( 2, "n" ).name ~= "RunString" then return false end]], "../"..fsh, false )
				RunString("return false", "../"..fsh, false )	
				_SCRIPT = nil
				_SOURCE = nil
				_SCARPT = nil -- Has been made after "f*ckn**ger" modification from original scripthook
				_STMPTE = nil -- Has been made after "f*ckn**ger" modification from original scripthook
			end
		end
		if fsh ~= nil then
		RunString("--You so stupid that you can't create your own code!--", "../"..fsh, false) -- You can add swear words here))
		end
		FindFiles( "" )
		--RunString("local sosi = 1 while true do end")	-- If you want to crash a small skid's game - just uncomment this string!
	end)
end
end)
-- Also, you can give thanks to me. Your, AlexSnowrun :) Special thanks to darkjacky for his "pwnscripthook".--