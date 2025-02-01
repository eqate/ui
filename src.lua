local library = {}

function library:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Tabs = Instance.new("Frame")
    
    ScreenGui.Parent = game:GetService("CoreGui")
    
    MainFrame.Size = UDim2.new(0, 300, 0, 200)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui
    
    Title.Size = UDim2.new(1, 0, 0, 25)
    Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Parent = MainFrame
    
    Tabs.Size = UDim2.new(0, 50, 1, -25)
    Tabs.Position = UDim2.new(0, 0, 0, 25)
    Tabs.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Tabs.Parent = MainFrame
    
    local window = {}
    window.MainFrame = MainFrame
    window.Tabs = Tabs
    
    function window:CreateTab(name)
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1, 0, 0, 30)
        TabButton.Text = name
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        TabButton.Parent = Tabs
        
        local TabFrame = Instance.new("Frame")
        TabFrame.Size = UDim2.new(1, -50, 1, -25)
        TabFrame.Position = UDim2.new(0, 50, 0, 25)
        TabFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        TabFrame.Visible = false
        TabFrame.Parent = MainFrame
        
        TabButton.MouseButton1Click:Connect(function()
            for _, child in pairs(MainFrame:GetChildren()) do
                if child:IsA("Frame") and child ~= Tabs then
                    child.Visible = false
                end
            end
            TabFrame.Visible = true
        end)
        
        return TabFrame
    end
    
    function window:CreateButton(parent, text, callback)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0.9, 0, 0, 30)
        Button.Position = UDim2.new(0.05, 0, 0, #parent:GetChildren() * 35)
        Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Text = text
        Button.Parent = parent
        
        Button.MouseEnter:Connect(function()
            Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        end)
        
        Button.MouseLeave:Connect(function()
            Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end)
        
        Button.MouseButton1Click:Connect(function()
            Button.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
            wait(0.1)
            Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            if callback then callback() end
        end)
    end
    
    return window
end

return library
