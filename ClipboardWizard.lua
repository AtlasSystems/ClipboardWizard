luanet.load_assembly("System.Windows.Forms");
local Clipboard = luanet.import_type("System.Windows.Forms.Clipboard");

-- Retrieve our settings and store them in local variables to prevent redundant fetching of settings.
local settings = {}
settings.CopyFormatString = GetSetting("CopyFormatString");

function SetClipboardContents()	
	local value = ReplaceTags(settings.CopyFormatString);		
	if ((value == nil) or (value == null) or (value == '')) then		
		LogDebug('[Clipboard Wizard] Clearing clipboard contents');
		Clipboard.Clear();	
	else
		LogDebug('[Clipboard Wizard] Setting clipboard contents: ' .. value);		
		Clipboard.SetText(value);	
	end
end

function Init()	
	local success = pcall(SetClipboardContents);
	if (not success) then
		LogDebug('[Clipboard Wizard] Error setting clipboard contents');					
	end			
end

function ReplaceTags(input)
	LogDebug('[Clipboard Wizard] Getting replacement for '.. input);
    return input:gsub( '{(.-)}', function( token ) return ReplaceTag(token) end )
end

function MapFieldValue(fieldDefinition)
	if (fieldDefinition) then
		LogDebug('[Clipboard Wizard] Mapping FieldValue for ' .. fieldDefinition);
		local separatorIndex = string.find(fieldDefinition, "%.");

		if (separatorIndex and separatorIndex > 0) then
			local table = string.sub(fieldDefinition, 1, separatorIndex - 1);
			local field = string.sub(fieldDefinition, separatorIndex + 1);

			local value = nil;

			if (table == "Setting") then
				LogDebug('[Clipboard Wizard] Getting TableField. Setting: ' .. field);
				value = GetSetting(field);
			else
				LogDebug('[Clipboard Wizard] Getting TableField. Table: '.. table .. '. Field: ' .. field);
				value = GetFieldValue(table, field);
			end
						
			if (value == null) then
				LogDebug('[Clipboard Wizard] Replacement value is null.');
				value = '';
			end						
			return value;            
		end
	end

	return '';
end

function ReplaceTag(input)    
	--The replacement must not return nil otherwise input.gsub will not process the replacement and leave the tagging syntax in place 

    LogDebug('[Clipboard Wizard] Process tag replacements for '..input);    
			
    if (input:sub(1,11):lower() == "tablefield:") then        
        return MapFieldValue(input:sub(12));    
    else
        return '';
    end
end