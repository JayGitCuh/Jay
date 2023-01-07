if getgenv().vozoidcustomdrawingpropertiesconnectionsudim2 then return end
getgenv().vozoidcustomdrawingpropertiesconnectionsudim2 = true

local inputService = game:GetService("UserInputService")

local Signal = loadstring(game:HttpGet("https://raw.githubusercontent.com/JayGitCuh/Jay/main/roblox/backups/signals.lua"))()

local customProperties = {}
local customConnections = {}

local olddrawing = Drawing.new

Drawing.new = function(shape)
    local obj = olddrawing(shape)

    for _, property in next, customProperties do
        if property.default then
            rawset(obj, tostring(property.name), property.default)
        else
            rawset(obj, tostring(property.name), "")
        end
    end

    game:GetService("RunService").RenderStepped:connect(function()
        if rawget(obj, "PositionXScale") then
            obj.Position = UDim2.new(obj.PositionXScale, obj.PositionXOffset, obj.PositionYScale, obj.PositionYOffset)
        end
    end)

    game:GetService("RunService").RenderStepped:connect(function()
        if rawget(obj, "SizeXScale") then
            obj.Size = UDim2.new(obj.SizeXScale, obj.SizeXOffset, obj.SizeYScale, obj.SizeYOffset)
        end
    end)

    local oldnewindex
    oldnewindex = hookfunction(getmetatable(obj).__newindex, function(t, k, v)
        if customProperties[k] then
            if customProperties[k].default then
                rawset(obj, customProperties[k].name, customProperties[k].default)
            else
                rawset(obj, customProperties[k].name, "")
            end
        end

        if k == "Parent" then
            rawset(t, k, v)
        end
        
        if k == "Position" then
            if typeof(v) ~= "Vector2" then
                local x, y

                if t.Parent ~= nil then
                    x = t.Parent.AbsolutePosition.X + (v.X.Scale * t.Parent.AbsoluteSize.X) + v.X.Offset
                    y = t.Parent.AbsolutePosition.Y + (v.Y.Scale * t.Parent.AbsoluteSize.Y) + v.Y.Offset
                else
                    x = (v.X.Scale * workspace.CurrentCamera.ViewportSize.X) + v.X.Offset
                    y = (v.Y.Scale * workspace.CurrentCamera.ViewportSize.Y) + v.Y.Offset
                end

				rawset(t, "AbsolutePosition", Vector2.new(x, y))

                rawset(t, "PositionXScale", v.X.Scale)
                rawset(t, "PositionXOffset", v.X.Offset)

                rawset(t, "PositionYScale", v.Y.Scale)
                rawset(t, "PositionYOffset", v.Y.Offset)
            
                return oldnewindex(t, k, Vector2.new(x, y))
            else
                return oldnewindex(t, k, v)
            end
        end

        if k == "Size" then
            if typeof(v) ~= "Vector2" then
                local x, y

                if t.Parent ~= nil then
                    x = (v.X.Scale * t.Parent.AbsoluteSize.X) + v.X.Offset
                    y = (v.Y.Scale * t.Parent.AbsoluteSize.Y) + v.Y.Offset
                else
                    x = (v.X.Scale * workspace.CurrentCamera.ViewportSize.X) + v.X.Offset
                    y = (v.Y.Scale * workspace.CurrentCamera.ViewportSize.Y) + v.Y.Offset
                end

				rawset(t, "AbsoluteSize", Vector2.new(x, y))

                rawset(t, "SizeXScale", v.X.Scale)
                rawset(t, "SizeXOffset", v.X.Offset)

                rawset(t, "SizeYScale", v.Y.Scale)
                rawset(t, "SizeYOffset", v.Y.Offset)
            
                return oldnewindex(t, k, Vector2.new(x, y))
            else
                return oldnewindex(t, k, v)
            end
        end
        
        if not customProperties[k] and not customConnections[k] and k ~= "Position" and k ~= "Size" and k ~= "Parent" then
            return oldnewindex(t, k, v)
        end
    end)

    local oldindex
    oldindex = hookfunction(getmetatable(obj).__index, function(t, k, v)
        if customConnections[k] then
            local signal = Signal.new()
    
            customConnections[k].fire(signal, t)
    
            return signal
        end

        if customProperties[k] then
            return rawget(t, k)
        end

        if k == "Parent" then
            return rawget(t, k)
        end
        
        return oldindex(t, k, v)
    end)

    return obj
end

function Drawing.AddCustomProperty(name, default)
    customProperties[name] = {["name"] = tostring(name), ["default"] = default}
end

function Drawing.AddCustomConnection(name, fire)
    customConnections[name] = {["name"] = tostring(name), ["fire"] = fire}
end
