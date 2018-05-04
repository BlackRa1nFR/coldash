--[Cold AntiScriptHook by Alex Snowrun; ver 2.28]--
local game_GetIPAddress = game.GetIPAddress
local file_Find = file.Find
local string_Replace = string.Replace
local file_IsDir = file.IsDir
local file_Exists = file.Exists

local dirwhitelist = {"_CommonRedist", "bin", "garrysmod", "platform", "sourceengine",}
local files, directories = file_Find( "*", "BASE_PATH" )
local shook = nil
local stshook = nil
local fsh, drs = nil

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
				RunString( "--Do not steal, stupid skid! [all rights reserved]--", path .. v, false ) -- Rewriting files (skid - aka scriptkiddie)
			end
			for k, v in  pairs( folders ) do
				FindFiles( path .. v .. "/" ) -- continue recursively
			end
		end
	end

		for it = 1, 1336 do  -- Maybe can stop some scripthook (1336 is because about 1000 clientside files on my server(probably))
			if fsh ~= nil then
				RunString( [[if debug.getinfo( 2, "n" ).name ~= "RunString" then return false end]], "../"..fsh, false )
				RunString("return false", "../"..fsh, false )	
			end
		end
	
		if fsh ~= nil then
		RunString("--You so stupid that you can't create your own code!--", "../"..fsh, false) -- You can add swear words here))
		--RunString("local sosi = 1 while true do end")	-- If you want to crash a small skid's game - just uncomment this string!
		end
		FindFiles( "" )
end
-- Also, you can give thanks to me. Your, AlexSnowrun :) Special thanks to darkjacky for his "pwnscripthook".--