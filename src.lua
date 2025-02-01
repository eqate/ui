local library = {}

function library:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    
    ScreenGui.Parent = game:GetService("CoreGui")
    
    MainFrame.Size = UDim2.new(0, 300, 0, 200)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.Parent = ScreenGui
    
    Title.Size = UDim2.new(1, 0, 0, 25)
    Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Parent = MainFrame
    
    local window = {}
    window.MainFrame = MainFrame
    
    function window:CreateButton(text, callback)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0.9, 0, 0, 30)
        Button.Position = UDim2.new(0.05, 0, 0, #MainFrame:GetChildren() * 35)
        Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Text = text
        Button.Parent = MainFrame
        
        Button.MouseButton1Click:Connect(function()
            if callback then callback() end
        end)
    end
    
    return window
end

return library
