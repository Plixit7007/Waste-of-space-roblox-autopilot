local screen = GetPartFromPort(1, "Screen")
local keyb = GetPartFromPort(2, "Keyboard")
local inst = GetPartFromPort(3, "Instrument")

print("Flight computer has been started.")
local p1 = Vector3.new(0, 0, 0)
local p2 = Vector3.new(2, 0, 0)
local distance = (p1 - p2).Magnitude
local running = true
screen:ClearElements()

function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end
local TextLabel = screen:CreateElement('TextLabel', {
    AnchorPoint = Vector2.new(0.5, 0.5);
    Position = UDim2.fromScale(0.5, 0.5);
    Size = UDim2.fromScale(1, 1);
    Text = 'Autopilot inactive...';
    TextSize = 20;
    TextScaled = false;
    TextColor3 = Color3.new(1, 0, 1)
})
keyb:Connect("TextInputted", function(text)
    TextLabel:ChangeProperties({ -- change the text and size
    Text = text;
    })
    local input = text
    local argv = split(input, " ")
    local com = table.remove(argv, 1)
    
    for _, v in pairs(argv) do
        argv = v
    end
    if string.lower(com) == "anchor" and string.lower(argv) == "true" then
        TextLabel:ChangeProperties({
            Text = "Anchor anchored."
        })
    end
    if string.lower(com) == "anchor" and string.lower(argv) == "false" then
        TextLabel:ChangeProperties({
            Text = "Anchor dropped."
        })
        print("hello")
    end
end)
while task.wait() do
end
