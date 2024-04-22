lunajson = require 'lunajson'
local exec = io.popen("sensors -j")
local content = exec:read("*all")
print("", content)
exec:close()

local sensors_table = lunajson:decode( tmp )
local temp_values = {}

for _, sensor in ipairs(sensors_table['sensors']) do
    local label = sensor['label']:match('^([^%(%)]+)')
    if label then
        table.insert(temp_values, { name = label, value = tonumber(sensor['value']):float():round(1), unit = '°C' })
    end
end

return tempratures_to_string(temp_values)

