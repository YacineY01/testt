-- Decompiled with Velocity Script Decompiler
task.wait(0.5)
game:GetService("UserInputService")
local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("TweenService")
local _ = game.ReplicatedStorage.Remotes
local v_u_3 = game.ReplicatedStorage.Assets
local _ = game.ReplicatedStorage.Tags
local v_u_4 = workspace.CurrentCamera
setmetatable({}, {
    ["__index"] = function(_, _)
        return false
    end
})
task.spawn(function()
    -- upvalues: (copy) v_u_4, (copy) v_u_1
    local function v6()
        -- upvalues: (ref) v_u_4
        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health == 0 then
            task.spawn(function()
                -- upvalues: (ref) v_u_4
                local _ = workspace.CurrentCamera
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    v_u_4.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
                    v_u_4.CameraType = Enum.CameraType.Custom
                end
                for _, v5 in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
                    if v5:IsA("ScreenGui") then
                        v5.Enabled = true
                    end
                end
                task.wait(0.5)
            end)
        end
    end
    v_u_1.RenderStepped:Connect(v6)
end)
function newRay(p7, p8, p9, p10)
    local v11, v12, v13 = game.Workspace:FindPartOnRay(Ray.new(p7, CFrame.new(p7, p8).lookVector * p9), p10)
    return v11, v12, v13
end
local v_u_14 = {
    [1] = CFrame.Angles(0, 0, 0.2617993877991494),
    [2] = CFrame.Angles(0, 0, -0.2617993877991494),
    [3] = CFrame.Angles(0, 0, -0.7853981633974483),
    [4] = CFrame.Angles(0, 2.443460952792061, 0),
    [5] = CFrame.Angles(0, 0, -0.7853981633974483),
    [0] = CFrame.Angles(-1.7453292519943295, 0, 1.5707963267948966),
    [99] = CFrame.Angles(-1.7453292519943295, 0, 1.5707963267948966)
}
local v_u_15 = {
    [1] = 480,
    [2] = -480,
    [3] = 480,
    [4] = -530,
    [5] = 480,
    [0] = 480,
    [99] = 480
}
local v_u_16 = require(v_u_3.rockModule)
local function v_u_35(p17, p18, p19)
    -- upvalues: (copy) v_u_16, (copy) v_u_14, (copy) v_u_15, (copy) v_u_2
    if p19.Character then
        p19 = p19.Character
    end
    local v20 = p19.HumanoidRootPart
    task.wait(0.2 + p17 / 13)
    local v_u_21 = script.Slash:Clone()
    v_u_21.water1SFX:Play()
    v_u_21.waveSFX:Play()
    if p17 == 0 then
        local v_u_22 = script.AirSlash:Clone()
        task.spawn(function()
            -- upvalues: (ref) v_u_22
            v_u_22.Attachment.Slash.Enabled = true
            task.wait(0.2)
            v_u_22.Attachment.Slash.Enabled = false
        end)
        local v_u_23 = script.groundSmoke:Clone()
        v_u_23.CFrame = v20.CFrame * CFrame.new(0, -1, 0)
        v_u_23.Parent = workspace.GarbageCollection
        v_u_21 = v_u_22
        for _, v24 in pairs(v_u_23.Attachment:GetChildren()) do
            v24:Emit(50)
        end
        v_u_21.water1SFX:Play()
        v_u_21.waveSFX:Play()
        task.spawn(function()
            -- upvalues: (copy) v_u_23
            for _, v25 in pairs(script.groundSFX:GetChildren()) do
                local v26 = v25:Clone()
                v26.Parent = v_u_23
                v26.Volume = math.random(1, 7) / 10
                v26:Play()
                game.Debris:AddItem(v26, 3)
            end
        end)
        v_u_16({
            ["Origin"] = v20.CFrame * CFrame.new(0, -0.5, 0),
            ["Radius"] = 10,
            ["Amount"] = 8,
            ["Size"] = Vector3.new(2, 2, 2)
        })
    elseif p17 == 4 then
        local v27 = v_u_21.frontSlash
        v27.CFrame = v27.CFrame * CFrame.new(0, 0, -4)
        v_u_21.frontSlash.Orientation = Vector3.new(-9, -61.001, 90.003)
        v_u_21.frontSlash.Slice1.Enabled = true
        task.delay(0.2, function()
            -- upvalues: (ref) v_u_21
            v_u_21.frontSlash.Slice1.Enabled = false
        end)
    end
    local v28 = v_u_14[p17]
    local v29 = v_u_21.Attachment.Slashblue
    local v30 = v_u_21.Attachment.Slash
    if v28 then
        if p17 == 0 then
            local v_u_31 = script.airShock:Clone()
            v_u_31.Parent = workspace.GarbageCollection
            v_u_31.CFrame = v20.CFrame * CFrame.new(0, -3, 0)
            task.spawn(function()
                -- upvalues: (copy) v_u_31
                for _, v32 in pairs(v_u_31.att:GetChildren()) do
                    v32:Emit(math.random(1, 5))
                end
            end)
            v_u_21.CFrame = v20.CFrame * CFrame.new(0, 1, -1) * v28
            task.spawn(function()
                -- upvalues: (ref) v_u_21
                while v_u_21.Wheel.Transparency ~= 1 do
                    v_u_21.CFrame = v_u_21.CFrame * CFrame.fromEulerAnglesXYZ(0.05, 0, 0) * CFrame.new(0, 0, 0)
                    task.wait()
                end
            end)
        else
            v_u_21.CFrame = v20.CFrame * CFrame.new(0, 1, -3) * v28
        end
        v_u_21.Parent = workspace.GarbageCollection
        v29.RotSpeed = NumberRange.new(v_u_15[p17])
        v30.RotSpeed = NumberRange.new(v_u_15[p17])
        v29.Rotation = NumberRange.new(-20)
        v30.Rotation = NumberRange.new(-20)
        v_u_21.Name = "slash" .. p17
        game.Debris:AddItem(v_u_21, 3)
        for _, v_u_33 in pairs(v_u_21:GetDescendants()) do
            if v_u_33.Name == "Foam" then
                if p18 == true then
                    v_u_33:Emit(1)
                else
                    v_u_33:Emit(8)
                end
            elseif v_u_33.Name == "Wind" or v_u_33.Name == "Wind2" then
                task.spawn(function()
                    -- upvalues: (copy) v_u_33
                    v_u_33.Enabled = true
                    task.wait(0.6)
                    v_u_33.Enabled = false
                end)
            elseif v_u_33:IsA("ParticleEmitter") and (v_u_33.Name ~= "Foam" and v_u_33.Name ~= "Slice1") then
                v_u_33:Emit(5)
            elseif v_u_33.Name == "Wheel" or (v_u_33.Name == "Wheel1" or v_u_33.Name == "Wheel2") then
                task.spawn(function()
                    -- upvalues: (ref) v_u_2, (copy) v_u_33
                    task.wait(0.5)
                    local v34 = v_u_2:Create(v_u_33, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                        ["Transparency"] = 1
                    })
                    v34:Play()
                    v34:Destroy()
                end)
            end
        end
        task.wait(0.5)
        v_u_21.light.Enabled = false
    else
        warn("Invalid combo value:", p17)
    end
end
local function v_u_71(p_u_36, p37)
    -- upvalues: (copy) v_u_16, (copy) v_u_14, (copy) v_u_15, (copy) v_u_2
    local v_u_38 = p37.Character
    local v_u_39 = v_u_38.HumanoidRootPart
    if p_u_36 == 99 then
        task.wait()
    else
        task.wait(0.2 + p_u_36 / 13)
    end
    local v_u_40 = script.fireSlash:Clone()
    if p_u_36 == 0 then
        local v_u_41 = script.fireAirSlash:Clone()
        task.spawn(function()
            -- upvalues: (ref) v_u_41
            v_u_41.Attachment.Slash.Enabled = true
            task.wait(0.2)
            v_u_41.Attachment.Slash.Enabled = false
        end)
        local v42 = script.groundSmoke:Clone()
        v42.CFrame = v_u_39.CFrame * CFrame.new(0, -1, 0)
        v42.Parent = workspace.GarbageCollection
        v_u_40 = v_u_41
        for _, v43 in pairs(v42.Attachment:GetChildren()) do
            v43:Emit(50)
        end
        v_u_16({
            ["Origin"] = v_u_39.CFrame * CFrame.new(0, -0.5, 0),
            ["Radius"] = 10,
            ["Amount"] = 8,
            ["Size"] = Vector3.new(2, 2, 2)
        })
    elseif p_u_36 == 99 then
        local v_u_44 = script.clearBlueSky:Clone()
        task.spawn(function()
            -- upvalues: (ref) v_u_44
            v_u_44.Attachment.Slash.Enabled = true
            task.wait(0.2)
            v_u_44.Attachment.Slash.Enabled = false
        end)
        local v45 = script.groundSmoke:Clone()
        v45.CFrame = v_u_39.CFrame * CFrame.new(0, -1, 0)
        v45.Parent = workspace.GarbageCollection
        v_u_40 = v_u_44
        for _, v46 in pairs(v45.Attachment:GetChildren()) do
            v46:Emit(50)
        end
        task.spawn(function()
            -- upvalues: (ref) v_u_16, (copy) v_u_39
            for _ = 1, 25 do
                local v47 = math.random(-360, 360)
                local v48 = v_u_16
                local v49 = {
                    ["Origin"] = v_u_39.CFrame * CFrame.new(math.random(-25, 25), -0.5, math.random(-3, 3)) * CFrame.Angles(math.rad(v47), math.rad(v47), (math.rad(v47))),
                    ["Radius"] = 1,
                    ["Amount"] = 1
                }
                local v50 = math.random(1, 3)
                local v51 = math.random(1, 3)
                local v52 = math.random
                v49.Size = Vector3.new(v50, v51, v52(1, 3))
                v48(v49)
            end
        end)
    elseif p_u_36 == 4 then
        local v53 = v_u_40.frontSlash
        v53.CFrame = v53.CFrame * CFrame.new(0, 0, -4)
        v_u_40.frontSlash.Orientation = Vector3.new(-9, -61.001, 90.003)
        v_u_40.frontSlash.Slice1.Enabled = true
        task.delay(0.2, function()
            -- upvalues: (ref) v_u_40
            v_u_40.frontSlash.Slice1.Enabled = false
        end)
    end
    v_u_40.Fire:Play()
    v_u_40.Fire2:Play()
    v_u_40.Fire4:Play()
    task.delay(1.4, function()
        -- upvalues: (ref) v_u_40
        v_u_40.Fire4:Stop()
    end)
    local v54 = v_u_14[p_u_36]
    local v55 = v_u_40.Attachment.Slashblue
    local v56 = v_u_40.Attachment.Slash
    if v54 then
        if p_u_36 == 0 then
            local v_u_57 = script.airShock:Clone()
            v_u_57.Parent = workspace.GarbageCollection
            v_u_57.CFrame = v_u_39.CFrame * CFrame.new(0, -3, 0)
            task.spawn(function()
                -- upvalues: (copy) v_u_57
                for _, v58 in pairs(v_u_57.att:GetChildren()) do
                    v58:Emit(math.random(1, 5))
                end
            end)
            v_u_40.CFrame = v_u_39.CFrame * CFrame.new(0, 1, -1) * v54
            task.spawn(function()
                -- upvalues: (ref) v_u_40
                while v_u_40.Wheel.Transparency ~= 1 do
                    v_u_40.CFrame = v_u_40.CFrame * CFrame.fromEulerAnglesXYZ(0.05, 0, 0) * CFrame.new(0, 0, 0)
                    task.wait()
                end
            end)
        elseif p_u_36 == 99 then
            v_u_40.CFrame = v_u_39.CFrame * CFrame.new(0, 1, -1) * v54
            task.spawn(function()
                -- upvalues: (ref) v_u_40
                while v_u_40.Wheel.Transparency ~= 1 do
                    v_u_40.CFrame = v_u_40.CFrame * CFrame.fromEulerAnglesXYZ(-0.05, 0, 0) * CFrame.new(0, 0, 0)
                    task.wait()
                end
            end)
        else
            v_u_40.CFrame = v_u_39.CFrame * CFrame.new(0, 1, -3) * v54
        end
        v_u_40.Parent = workspace.GarbageCollection
        v55.RotSpeed = NumberRange.new(v_u_15[p_u_36])
        v56.RotSpeed = NumberRange.new(v_u_15[p_u_36])
        v55.Rotation = NumberRange.new(-20)
        v56.Rotation = NumberRange.new(-20)
        v_u_40.Name = "slash" .. p_u_36
        task.delay(0.09, function()
            -- upvalues: (copy) v_u_38, (copy) v_u_39, (copy) p_u_36
            local v_u_59 = script.floorburn:Clone()
            v_u_59.Parent = workspace.GarbageCollection
            task.spawn(function()
                -- upvalues: (ref) v_u_38, (ref) v_u_39, (copy) v_u_59
                local v60 = RaycastParams.new()
                v60.FilterDescendantsInstances = { v_u_38, workspace.GarbageCollection }
                v60.FilterType = Enum.RaycastFilterType.Exclude
                v60.IgnoreWater = true
                local v61 = v_u_39.Position
                local v62 = CFrame.new(v61).UpVector * -10
                local v63 = game.Workspace:Raycast(v61, v62, v60)
                if v63 then
                    local v64 = v63.Instance or nil
                    local _ = v63.Position or nil
                    local _ = v63.Normal or nil
                    if v64 and v64.Name == "Water" then
                        v_u_59.Sizzle:Play()
                        v_u_59.Smoke.Enabled = true
                        task.wait(0.1)
                        v_u_59.Smoke.Enabled = false
                        v_u_59.Smoke:Emit(50)
                    end
                end
            end)
            if p_u_36 == 3 or p_u_36 == 5 then
                v_u_59.CFrame = v_u_39.CFrame * CFrame.new(5, -2.8, -4) * CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966)
            elseif p_u_36 == 1 then
                v_u_59.CFrame = v_u_39.CFrame * CFrame.new(0, -2.8, -6) * CFrame.Angles(0, 0.5235987755982988, 1.5707963267948966)
            elseif p_u_36 == 2 then
                v_u_59.CFrame = v_u_39.CFrame * CFrame.new(-3, -2.8, -6) * CFrame.Angles(0, -0.5235987755982988, 1.5707963267948966)
            elseif p_u_36 == 99 then
                v_u_59.CFrame = v_u_39.CFrame * CFrame.new(0, -2.8, 0) * CFrame.Angles(0, 0, 1.5707963267948966)
            else
                v_u_59.CFrame = v_u_39.CFrame * CFrame.new(0, -2.8, -9) * CFrame.Angles(0, 0, 1.5707963267948966)
            end
            task.delay(0.3, function()
                -- upvalues: (copy) v_u_59
                for _, v_u_65 in pairs(v_u_59:GetDescendants()) do
                    if v_u_65:IsA("Beam") then
                        task.spawn(function()
                            -- upvalues: (copy) v_u_65
                            for v66 = 0.5, 1, 0.01 do
                                v_u_65.Transparency = NumberSequence.new(v66, 1)
                                task.wait()
                            end
                        end)
                    end
                end
            end)
        end)
        game.Debris:AddItem(v_u_40, 5)
        for _, v_u_67 in pairs(v_u_40:GetDescendants()) do
            if v_u_67.Name == "Foam" then
                if p_u_36 == 99 then
                    task.spawn(function()
                        -- upvalues: (copy) v_u_67
                        v_u_67.Enabled = true
                        task.wait(0.2)
                        v_u_67.Enabled = false
                    end)
                else
                    v_u_67:Emit(8)
                end
            elseif v_u_67.Name == "Wind" or v_u_67.Name == "Wind2" then
                task.spawn(function()
                    -- upvalues: (copy) v_u_67
                    v_u_67.Enabled = true
                    task.wait(0.6)
                    v_u_67.Enabled = false
                end)
            elseif v_u_67:IsA("ParticleEmitter") and (v_u_67.Name ~= "Foam" and v_u_67.Name ~= "Slice1") then
                if p_u_36 == 99 then
                    v_u_67:Emit(2)
                else
                    v_u_67:Emit(5)
                end
            elseif v_u_67.Name == "Wheel" or (v_u_67.Name == "Wheel1" or v_u_67.Name == "Wheel2") then
                task.spawn(function()
                    -- upvalues: (copy) p_u_36, (ref) v_u_2, (copy) v_u_67
                    if p_u_36 == 99 then
                        local v68 = v_u_2:Create(v_u_67, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
                            ["Size"] = v_u_67.Size * 6,
                            ["Transparency"] = 0.3
                        })
                        v68:Play()
                        v68:Destroy()
                        task.wait(0.3)
                        local v69 = v_u_2:Create(v_u_67, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
                            ["Transparency"] = 1
                        })
                        v69:Play()
                        v69:Destroy()
                    else
                        task.wait(0.5)
                        local v70 = v_u_2:Create(v_u_67, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                            ["Transparency"] = 1
                        })
                        v70:Play()
                        v70:Destroy()
                    end
                end)
            end
        end
        task.wait(0.5)
        v_u_40.light.Enabled = false
    else
        warn("Invalid combo value:", p_u_36)
    end
end
local function v_u_107(p_u_72, p73)
    -- upvalues: (copy) v_u_16, (copy) v_u_14, (copy) v_u_15, (copy) v_u_2
    local v_u_74 = p73.Character
    local v_u_75 = v_u_74.HumanoidRootPart
    if p_u_72 == 99 then
        task.wait()
    else
        task.wait(0.2 + p_u_72 / 13)
    end
    local v_u_76 = script.fireModeSlash:Clone()
    if p_u_72 == 0 then
        local v_u_77 = script.fireAirSlash:Clone()
        task.spawn(function()
            -- upvalues: (ref) v_u_77
            v_u_77.Attachment.Slash.Enabled = true
            task.wait(0.2)
            v_u_77.Attachment.Slash.Enabled = false
        end)
        local v78 = script.groundSmoke:Clone()
        v78.CFrame = v_u_75.CFrame * CFrame.new(0, -1, 0)
        v78.Parent = workspace.GarbageCollection
        v_u_76 = v_u_77
        for _, v79 in pairs(v78.Attachment:GetChildren()) do
            v79:Emit(50)
        end
        v_u_16({
            ["Origin"] = v_u_75.CFrame * CFrame.new(0, -0.5, 0),
            ["Radius"] = 10,
            ["Amount"] = 8,
            ["Size"] = Vector3.new(2, 2, 2)
        })
    elseif p_u_72 == 99 then
        local v_u_80 = script.clearBlueSky:Clone()
        task.spawn(function()
            -- upvalues: (ref) v_u_80
            v_u_80.Attachment.Slash.Enabled = true
            task.wait(0.2)
            v_u_80.Attachment.Slash.Enabled = false
        end)
        local v81 = script.groundSmoke:Clone()
        v81.CFrame = v_u_75.CFrame * CFrame.new(0, -1, 0)
        v81.Parent = workspace.GarbageCollection
        v_u_76 = v_u_80
        for _, v82 in pairs(v81.Attachment:GetChildren()) do
            v82:Emit(50)
        end
        task.spawn(function()
            -- upvalues: (ref) v_u_16, (copy) v_u_75
            for _ = 1, 25 do
                local v83 = math.random(-360, 360)
                local v84 = v_u_16
                local v85 = {
                    ["Origin"] = v_u_75.CFrame * CFrame.new(math.random(-25, 25), -0.5, math.random(-3, 3)) * CFrame.Angles(math.rad(v83), math.rad(v83), (math.rad(v83))),
                    ["Radius"] = 1,
                    ["Amount"] = 1
                }
                local v86 = math.random(1, 3)
                local v87 = math.random(1, 3)
                local v88 = math.random
                v85.Size = Vector3.new(v86, v87, v88(1, 3))
                v84(v85)
            end
        end)
    elseif p_u_72 == 4 then
        local v89 = v_u_76.frontSlash
        v89.CFrame = v89.CFrame * CFrame.new(0, 0, -4)
        v_u_76.frontSlash.Orientation = Vector3.new(-9, -61.001, 90.003)
        v_u_76.frontSlash.Slice1.Enabled = true
        task.delay(0.2, function()
            -- upvalues: (ref) v_u_76
            v_u_76.frontSlash.Slice1.Enabled = false
        end)
    end
    v_u_76.Fire:Play()
    v_u_76.Fire2:Play()
    v_u_76.Fire4:Play()
    task.delay(1.4, function()
        -- upvalues: (ref) v_u_76
        v_u_76.Fire4:Stop()
    end)
    local v90 = v_u_14[p_u_72]
    local v91 = v_u_76.Attachment.Slashblue
    local v92 = v_u_76.Attachment.Slash
    if v90 then
        if p_u_72 == 0 then
            local v_u_93 = script.airShock:Clone()
            v_u_93.Parent = workspace.GarbageCollection
            v_u_93.CFrame = v_u_75.CFrame * CFrame.new(0, -3, 0)
            task.spawn(function()
                -- upvalues: (copy) v_u_93
                for _, v94 in pairs(v_u_93.att:GetChildren()) do
                    v94:Emit(math.random(1, 5))
                end
            end)
            v_u_76.CFrame = v_u_75.CFrame * CFrame.new(0, 1, -1) * v90
            task.spawn(function()
                -- upvalues: (ref) v_u_76
                while v_u_76.Wheel.Transparency ~= 1 do
                    v_u_76.CFrame = v_u_76.CFrame * CFrame.fromEulerAnglesXYZ(0.05, 0, 0) * CFrame.new(0, 0, 0)
                    task.wait()
                end
            end)
        elseif p_u_72 == 99 then
            v_u_76.CFrame = v_u_75.CFrame * CFrame.new(0, 1, -1) * v90
            task.spawn(function()
                -- upvalues: (ref) v_u_76
                while v_u_76.Wheel.Transparency ~= 1 do
                    v_u_76.CFrame = v_u_76.CFrame * CFrame.fromEulerAnglesXYZ(-0.05, 0, 0) * CFrame.new(0, 0, 0)
                    task.wait()
                end
            end)
        else
            v_u_76.CFrame = v_u_75.CFrame * CFrame.new(0, 1, -3) * v90
        end
        v_u_76.Parent = workspace.GarbageCollection
        v91.RotSpeed = NumberRange.new(v_u_15[p_u_72])
        v92.RotSpeed = NumberRange.new(v_u_15[p_u_72])
        v91.Rotation = NumberRange.new(-20)
        v92.Rotation = NumberRange.new(-20)
        v_u_76.Name = "slash" .. p_u_72
        task.delay(0.09, function()
            -- upvalues: (copy) v_u_74, (copy) v_u_75, (copy) p_u_72
            local v_u_95 = script.floorburn:Clone()
            v_u_95.Parent = workspace.GarbageCollection
            task.spawn(function()
                -- upvalues: (ref) v_u_74, (ref) v_u_75, (copy) v_u_95
                local v96 = RaycastParams.new()
                v96.FilterDescendantsInstances = { v_u_74, workspace.GarbageCollection }
                v96.FilterType = Enum.RaycastFilterType.Exclude
                v96.IgnoreWater = true
                local v97 = v_u_75.Position
                local v98 = CFrame.new(v97).UpVector * -10
                local v99 = game.Workspace:Raycast(v97, v98, v96)
                if v99 then
                    local v100 = v99.Instance or nil
                    local _ = v99.Position or nil
                    local _ = v99.Normal or nil
                    if v100 and v100.Name == "Water" then
                        v_u_95.Sizzle:Play()
                        v_u_95.Smoke.Enabled = true
                        task.wait(0.1)
                        v_u_95.Smoke.Enabled = false
                        v_u_95.Smoke:Emit(50)
                    end
                end
            end)
            if p_u_72 == 3 or p_u_72 == 5 then
                v_u_95.CFrame = v_u_75.CFrame * CFrame.new(5, -2.8, -4) * CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966)
            elseif p_u_72 == 1 then
                v_u_95.CFrame = v_u_75.CFrame * CFrame.new(0, -2.8, -6) * CFrame.Angles(0, 0.5235987755982988, 1.5707963267948966)
            elseif p_u_72 == 2 then
                v_u_95.CFrame = v_u_75.CFrame * CFrame.new(-3, -2.8, -6) * CFrame.Angles(0, -0.5235987755982988, 1.5707963267948966)
            elseif p_u_72 == 99 then
                v_u_95.CFrame = v_u_75.CFrame * CFrame.new(0, -2.8, 0) * CFrame.Angles(0, 0, 1.5707963267948966)
            else
                v_u_95.CFrame = v_u_75.CFrame * CFrame.new(0, -2.8, -9) * CFrame.Angles(0, 0, 1.5707963267948966)
            end
            task.delay(0.3, function()
                -- upvalues: (copy) v_u_95
                for _, v_u_101 in pairs(v_u_95:GetDescendants()) do
                    if v_u_101:IsA("Beam") then
                        task.spawn(function()
                            -- upvalues: (copy) v_u_101
                            for v102 = 0.5, 1, 0.01 do
                                v_u_101.Transparency = NumberSequence.new(v102, 1)
                                task.wait()
                            end
                        end)
                    end
                end
            end)
        end)
        game.Debris:AddItem(v_u_76, 5)
        for _, v_u_103 in pairs(v_u_76:GetDescendants()) do
            if v_u_103.Name == "Foam" then
                if p_u_72 == 99 then
                    task.spawn(function()
                        -- upvalues: (copy) v_u_103
                        v_u_103.Enabled = true
                        task.wait(0.2)
                        v_u_103.Enabled = false
                    end)
                else
                    v_u_103:Emit(8)
                end
            elseif v_u_103.Name == "Wind" or v_u_103.Name == "Wind2" then
                task.spawn(function()
                    -- upvalues: (copy) v_u_103
                    v_u_103.Enabled = true
                    task.wait(0.6)
                    v_u_103.Enabled = false
                end)
            elseif v_u_103:IsA("ParticleEmitter") and (v_u_103.Name ~= "Foam" and v_u_103.Name ~= "Slice1") then
                if p_u_72 == 99 then
                    v_u_103:Emit(2)
                else
                    v_u_103:Emit(5)
                end
            elseif v_u_103.Name == "Wheel" or (v_u_103.Name == "Wheel1" or v_u_103.Name == "Wheel2") then
                task.spawn(function()
                    -- upvalues: (copy) p_u_72, (ref) v_u_2, (copy) v_u_103
                    if p_u_72 == 99 then
                        local v104 = v_u_2:Create(v_u_103, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
                            ["Size"] = v_u_103.Size * 6,
                            ["Transparency"] = 0.3
                        })
                        v104:Play()
                        v104:Destroy()
                        task.wait(0.3)
                        local v105 = v_u_2:Create(v_u_103, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
                            ["Transparency"] = 1
                        })
                        v105:Play()
                        v105:Destroy()
                    else
                        task.wait(0.5)
                        local v106 = v_u_2:Create(v_u_103, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                            ["Transparency"] = 1
                        })
                        v106:Play()
                        v106:Destroy()
                    end
                end)
            end
        end
        task.wait(0.5)
        v_u_76.light.Enabled = false
    else
        warn("Invalid combo value:", p_u_72)
    end
end
local function v_u_151(p_u_108, p109)
    -- upvalues: (copy) v_u_16, (copy) v_u_14, (copy) v_u_2, (copy) v_u_15
    local v_u_110 = p109.Character.HumanoidRootPart
    if p_u_108 == 99 then
        task.wait()
    else
        task.wait(0.2 + p_u_108 / 13)
    end
    local v_u_111 = script.moonSlash:Clone()
    if p_u_108 == 0 then
        local v_u_112 = script.moonSlash:Clone()
        task.spawn(function()
            -- upvalues: (ref) v_u_112
            v_u_112.Attachment.Slash.Enabled = true
            task.wait(0.2)
            v_u_112.Attachment.Slash.Enabled = false
        end)
        local v113 = script.groundSmoke:Clone()
        v113.CFrame = v_u_110.CFrame * CFrame.new(0, -1, 0)
        v113.Parent = workspace.GarbageCollection
        v_u_111 = v_u_112
        for _, v114 in pairs(v113.Attachment:GetChildren()) do
            v114:Emit(50)
        end
        v_u_16({
            ["Origin"] = v_u_110.CFrame * CFrame.new(0, -0.5, 0),
            ["Radius"] = 10,
            ["Amount"] = 8,
            ["Size"] = Vector3.new(2, 2, 2)
        })
    elseif p_u_108 == 4 then
        local v115 = v_u_111.frontSlash
        v115.CFrame = v115.CFrame * CFrame.new(0, 0, -4)
        v_u_111.frontSlash.Orientation = Vector3.new(-9, -61.001, 90.003)
        v_u_111.frontSlash.Slice1.Enabled = true
        task.delay(0.2, function()
            -- upvalues: (ref) v_u_111
            v_u_111.frontSlash.Slice1.Enabled = false
        end)
    end
    local v_u_116 = v_u_14[p_u_108]
    local v117 = v_u_111.Attachment.slashYellow
    local v118 = v_u_111.Attachment.Slash
    if v_u_116 then
        if p_u_108 == 0 then
            local v_u_119 = script.airShock:Clone()
            v_u_119.Parent = workspace.GarbageCollection
            v_u_119.CFrame = v_u_110.CFrame * CFrame.new(0, -3, 0)
            task.spawn(function()
                -- upvalues: (copy) v_u_119
                for _, v120 in pairs(v_u_119.att:GetChildren()) do
                    v120:Emit(math.random(1, 5))
                end
            end)
            task.spawn(function()
                -- upvalues: (ref) v_u_111, (copy) v_u_110, (copy) v_u_116, (ref) v_u_2
                v_u_111.CFrame = v_u_110.CFrame * CFrame.new(0, 1, -3) * v_u_116
                for _ = 1, 4 do
                    local v_u_121 = script.moonMeshSlash:Clone()
                    local v122 = v_u_110.CFrame * CFrame.new(math.random(-10, 10), math.random(-1, 4), math.random(-10, 10))
                    local v123 = CFrame.Angles
                    local v124 = math.random(-360, 360)
                    local v125 = math.rad(v124)
                    local v126 = math.random(-360, 360)
                    local v127 = math.rad(v126)
                    local v128 = math.random(-360, 360)
                    v_u_121:SetPrimaryPartCFrame(v122 * v123(v125, v127, (math.rad(v128))))
                    v_u_121.Parent = workspace.GarbageCollection
                    for _, v_u_129 in pairs(v_u_121:GetDescendants()) do
                        if v_u_129:IsA("ParticleEmitter") then
                            v_u_129:Emit(5)
                        end
                        if v_u_129:IsA("MeshPart") then
                            task.spawn(function()
                                -- upvalues: (ref) v_u_2, (copy) v_u_121, (copy) v_u_129
                                local v130 = v_u_2
                                local v131 = v_u_121.PrimaryPart
                                local v132 = TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1)
                                local v133 = {}
                                local v134 = v_u_121.PrimaryPart.CFrame
                                local v135 = CFrame.Angles
                                local v136 = math.random(-360, 360)
                                local v137 = math.rad(v136)
                                local v138 = math.random(-360, 360)
                                local v139 = math.rad(v138)
                                local v140 = math.random(-360, 360)
                                v133.CFrame = v134 * v135(v137, v139, math.rad(v140), 0)
                                local v141 = v130:Create(v131, v132, v133)
                                v141:Play()
                                v141:Destroy()
                                task.wait(0.2)
                                local v142 = v_u_2:Create(v_u_129, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                                    ["Transparency"] = 1
                                })
                                v142:Play()
                                v142:Destroy()
                            end)
                        end
                    end
                    task.wait(0.1)
                    game.Debris:AddItem(v_u_121, 3)
                    local v143 = v_u_2:Create(v_u_121.Main.light, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
                        ["Brightness"] = 0
                    })
                    v143:Play()
                    v143:Destroy()
                end
            end)
        elseif p_u_108 == 99 then
            v_u_111.CFrame = v_u_110.CFrame * CFrame.new(0, 1, -1) * v_u_116
            task.spawn(function()
                -- upvalues: (ref) v_u_111
                while v_u_111.Wheel.Transparency ~= 1 do
                    v_u_111.CFrame = v_u_111.CFrame * CFrame.fromEulerAnglesXYZ(-0.05, 0, 0) * CFrame.new(0, 0, 0)
                    task.wait()
                end
            end)
        else
            v_u_111.CFrame = v_u_110.CFrame * CFrame.new(0, 1, -3) * v_u_116
        end
        v_u_111.Parent = workspace.GarbageCollection
        v_u_111.woosh1:Play()
        v_u_111.woosh2:Play()
        v_u_111.wooshSFX:Play()
        v117.RotSpeed = NumberRange.new(v_u_15[p_u_108])
        v118.RotSpeed = NumberRange.new(v_u_15[p_u_108])
        v117.Rotation = NumberRange.new(-20)
        v118.Rotation = NumberRange.new(-20)
        v_u_111.Name = "slash" .. p_u_108
        task.delay(0.09, function()
            -- upvalues: (copy) p_u_108, (copy) v_u_110
            local v_u_144 = script.floorburn:Clone()
            v_u_144.Parent = workspace.GarbageCollection
            if p_u_108 == 3 or p_u_108 == 5 then
                v_u_144.CFrame = v_u_110.CFrame * CFrame.new(5, -2.8, -4) * CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966)
            elseif p_u_108 == 1 then
                v_u_144.CFrame = v_u_110.CFrame * CFrame.new(0, -2.8, -6) * CFrame.Angles(0, 0.5235987755982988, 1.5707963267948966)
            elseif p_u_108 == 2 then
                v_u_144.CFrame = v_u_110.CFrame * CFrame.new(-3, -2.8, -6) * CFrame.Angles(0, -0.5235987755982988, 1.5707963267948966)
            elseif p_u_108 == 99 then
                v_u_144.CFrame = v_u_110.CFrame * CFrame.new(0, -2.8, 0) * CFrame.Angles(0, 0, 1.5707963267948966)
            else
                v_u_144.CFrame = v_u_110.CFrame * CFrame.new(0, -2.8, -9) * CFrame.Angles(0, 0, 1.5707963267948966)
            end
            task.delay(0.3, function()
                -- upvalues: (copy) v_u_144
                for _, v_u_145 in pairs(v_u_144:GetDescendants()) do
                    if v_u_145:IsA("Beam") then
                        task.spawn(function()
                            -- upvalues: (copy) v_u_145
                            for v146 = 0.5, 1, 0.01 do
                                v_u_145.Transparency = NumberSequence.new(v146, 1)
                                task.wait()
                            end
                        end)
                    end
                end
            end)
        end)
        game.Debris:AddItem(v_u_111, 5)
        for _, v_u_147 in pairs(v_u_111:GetDescendants()) do
            if v_u_147.Name == "Foam" then
                if p_u_108 == 99 then
                    task.spawn(function()
                        -- upvalues: (copy) v_u_147
                        v_u_147.Enabled = true
                        task.wait(0.2)
                        v_u_147.Enabled = false
                    end)
                else
                    v_u_147:Emit(3)
                end
            elseif v_u_147.Name == "Wind" or v_u_147.Name == "Wind2" then
                task.spawn(function()
                    -- upvalues: (copy) v_u_147
                    v_u_147.Enabled = true
                    task.wait(0.6)
                    v_u_147.Enabled = false
                end)
            elseif v_u_147:IsA("ParticleEmitter") and (v_u_147.Name ~= "Foam" and v_u_147.Name ~= "Slice1") then
                if p_u_108 == 99 then
                    v_u_147:Emit(2)
                else
                    v_u_147:Emit(5)
                end
            elseif v_u_147.Name == "Wheel" or (v_u_147.Name == "Wheel1" or v_u_147.Name == "Wheel2") then
                task.spawn(function()
                    -- upvalues: (copy) p_u_108, (ref) v_u_2, (copy) v_u_147
                    if p_u_108 == 99 then
                        local v148 = v_u_2:Create(v_u_147, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
                            ["Size"] = v_u_147.Size * 6,
                            ["Transparency"] = 0.3
                        })
                        v148:Play()
                        v148:Destroy()
                        task.wait(0.3)
                        local v149 = v_u_2:Create(v_u_147, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
                            ["Transparency"] = 1
                        })
                        v149:Play()
                        v149:Destroy()
                    else
                        task.wait(0.5)
                        local v150 = v_u_2:Create(v_u_147, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                            ["Transparency"] = 1
                        })
                        v150:Play()
                        v150:Destroy()
                    end
                end)
            end
        end
        task.wait(0.5)
        v_u_111.light.Enabled = false
    else
        warn("Invalid combo value:", p_u_108)
    end
end
local function v_u_195(p_u_152, p153)
    -- upvalues: (copy) v_u_16, (copy) v_u_14, (copy) v_u_2, (copy) v_u_15
    local v_u_154 = p153.Character.HumanoidRootPart
    if p_u_152 == 99 then
        task.wait()
    else
        task.wait(0.2 + p_u_152 / 13)
    end
    local v_u_155 = script.moonModSlash:Clone()
    if p_u_152 == 0 then
        local v_u_156 = script.moonModSlash:Clone()
        task.spawn(function()
            -- upvalues: (ref) v_u_156
            v_u_156.Attachment.Slash.Enabled = true
            task.wait(0.2)
            v_u_156.Attachment.Slash.Enabled = false
        end)
        local v157 = script.groundSmoke:Clone()
        v157.CFrame = v_u_154.CFrame * CFrame.new(0, -1, 0)
        v157.Parent = workspace.GarbageCollection
        v_u_155 = v_u_156
        for _, v158 in pairs(v157.Attachment:GetChildren()) do
            v158:Emit(50)
        end
        v_u_16({
            ["Origin"] = v_u_154.CFrame * CFrame.new(0, -0.5, 0),
            ["Radius"] = 10,
            ["Amount"] = 8,
            ["Size"] = Vector3.new(2, 2, 2)
        })
    elseif p_u_152 == 4 then
        local v159 = v_u_155.frontSlash
        v159.CFrame = v159.CFrame * CFrame.new(0, 0, -4)
        v_u_155.frontSlash.Orientation = Vector3.new(-9, -61.001, 90.003)
        v_u_155.frontSlash.Slice1.Enabled = true
        task.delay(0.2, function()
            -- upvalues: (ref) v_u_155
            v_u_155.frontSlash.Slice1.Enabled = false
        end)
    end
    local v_u_160 = v_u_14[p_u_152]
    local v161 = v_u_155.Attachment.slashYellow
    local v162 = v_u_155.Attachment.Slash
    if v_u_160 then
        if p_u_152 == 0 then
            local v_u_163 = script.airShock:Clone()
            v_u_163.Parent = workspace.GarbageCollection
            v_u_163.CFrame = v_u_154.CFrame * CFrame.new(0, -3, 0)
            task.spawn(function()
                -- upvalues: (copy) v_u_163
                for _, v164 in pairs(v_u_163.att:GetChildren()) do
                    v164:Emit(math.random(1, 5))
                end
            end)
            task.spawn(function()
                -- upvalues: (ref) v_u_155, (copy) v_u_154, (copy) v_u_160, (ref) v_u_2
                v_u_155.CFrame = v_u_154.CFrame * CFrame.new(0, 1, -3) * v_u_160
                for _ = 1, 4 do
                    local v_u_165 = script.moonMeshSlash:Clone()
                    local v166 = v_u_154.CFrame * CFrame.new(math.random(-10, 10), math.random(-1, 4), math.random(-10, 10))
                    local v167 = CFrame.Angles
                    local v168 = math.random(-360, 360)
                    local v169 = math.rad(v168)
                    local v170 = math.random(-360, 360)
                    local v171 = math.rad(v170)
                    local v172 = math.random(-360, 360)
                    v_u_165:SetPrimaryPartCFrame(v166 * v167(v169, v171, (math.rad(v172))))
                    v_u_165.Parent = workspace.GarbageCollection
                    for _, v_u_173 in pairs(v_u_165:GetDescendants()) do
                        if v_u_173:IsA("ParticleEmitter") then
                            v_u_173:Emit(5)
                        end
                        if v_u_173:IsA("MeshPart") then
                            task.spawn(function()
                                -- upvalues: (ref) v_u_2, (copy) v_u_165, (copy) v_u_173
                                local v174 = v_u_2
                                local v175 = v_u_165.PrimaryPart
                                local v176 = TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1)
                                local v177 = {}
                                local v178 = v_u_165.PrimaryPart.CFrame
                                local v179 = CFrame.Angles
                                local v180 = math.random(-360, 360)
                                local v181 = math.rad(v180)
                                local v182 = math.random(-360, 360)
                                local v183 = math.rad(v182)
                                local v184 = math.random(-360, 360)
                                v177.CFrame = v178 * v179(v181, v183, math.rad(v184), 0)
                                local v185 = v174:Create(v175, v176, v177)
                                v185:Play()
                                v185:Destroy()
                                task.wait(0.2)
                                local v186 = v_u_2:Create(v_u_173, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                                    ["Transparency"] = 1
                                })
                                v186:Play()
                                v186:Destroy()
                            end)
                        end
                    end
                    task.wait(0.1)
                    game.Debris:AddItem(v_u_165, 3)
                    local v187 = v_u_2:Create(v_u_165.Main.light, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
                        ["Brightness"] = 0
                    })
                    v187:Play()
                    v187:Destroy()
                end
            end)
        elseif p_u_152 == 99 then
            v_u_155.CFrame = v_u_154.CFrame * CFrame.new(0, 1, -1) * v_u_160
            task.spawn(function()
                -- upvalues: (ref) v_u_155
                while v_u_155.Wheel.Transparency ~= 1 do
                    v_u_155.CFrame = v_u_155.CFrame * CFrame.fromEulerAnglesXYZ(-0.05, 0, 0) * CFrame.new(0, 0, 0)
                    task.wait()
                end
            end)
        else
            v_u_155.CFrame = v_u_154.CFrame * CFrame.new(0, 1, -3) * v_u_160
        end
        v_u_155.Parent = workspace.GarbageCollection
        v_u_155.woosh1:Play()
        v_u_155.woosh2:Play()
        v_u_155.wooshSFX:Play()
        v161.RotSpeed = NumberRange.new(v_u_15[p_u_152])
        v162.RotSpeed = NumberRange.new(v_u_15[p_u_152])
        v161.Rotation = NumberRange.new(-20)
        v162.Rotation = NumberRange.new(-20)
        v_u_155.Name = "slash" .. p_u_152
        task.delay(0.09, function()
            -- upvalues: (copy) p_u_152, (copy) v_u_154
            local v_u_188 = script.floorburn:Clone()
            v_u_188.Parent = workspace.GarbageCollection
            if p_u_152 == 3 or p_u_152 == 5 then
                v_u_188.CFrame = v_u_154.CFrame * CFrame.new(5, -2.8, -4) * CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966)
            elseif p_u_152 == 1 then
                v_u_188.CFrame = v_u_154.CFrame * CFrame.new(0, -2.8, -6) * CFrame.Angles(0, 0.5235987755982988, 1.5707963267948966)
            elseif p_u_152 == 2 then
                v_u_188.CFrame = v_u_154.CFrame * CFrame.new(-3, -2.8, -6) * CFrame.Angles(0, -0.5235987755982988, 1.5707963267948966)
            elseif p_u_152 == 99 then
                v_u_188.CFrame = v_u_154.CFrame * CFrame.new(0, -2.8, 0) * CFrame.Angles(0, 0, 1.5707963267948966)
            else
                v_u_188.CFrame = v_u_154.CFrame * CFrame.new(0, -2.8, -9) * CFrame.Angles(0, 0, 1.5707963267948966)
            end
            task.delay(0.3, function()
                -- upvalues: (copy) v_u_188
                for _, v_u_189 in pairs(v_u_188:GetDescendants()) do
                    if v_u_189:IsA("Beam") then
                        task.spawn(function()
                            -- upvalues: (copy) v_u_189
                            for v190 = 0.5, 1, 0.01 do
                                v_u_189.Transparency = NumberSequence.new(v190, 1)
                                task.wait()
                            end
                        end)
                    end
                end
            end)
        end)
        game.Debris:AddItem(v_u_155, 5)
        for _, v_u_191 in pairs(v_u_155:GetDescendants()) do
            if v_u_191.Name == "Foam" then
                if p_u_152 == 99 then
                    task.spawn(function()
                        -- upvalues: (copy) v_u_191
                        v_u_191.Enabled = true
                        task.wait(0.2)
                        v_u_191.Enabled = false
                    end)
                else
                    v_u_191:Emit(3)
                end
            elseif v_u_191.Name == "Wind" or v_u_191.Name == "Wind2" then
                task.spawn(function()
                    -- upvalues: (copy) v_u_191
                    v_u_191.Enabled = true
                    task.wait(0.6)
                    v_u_191.Enabled = false
                end)
            elseif v_u_191:IsA("ParticleEmitter") and (v_u_191.Name ~= "Foam" and v_u_191.Name ~= "Slice1") then
                if p_u_152 == 99 then
                    v_u_191:Emit(2)
                else
                    v_u_191:Emit(5)
                end
            elseif v_u_191.Name == "Wheel" or (v_u_191.Name == "Wheel1" or v_u_191.Name == "Wheel2") then
                task.spawn(function()
                    -- upvalues: (copy) p_u_152, (ref) v_u_2, (copy) v_u_191
                    if p_u_152 == 99 then
                        local v192 = v_u_2:Create(v_u_191, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
                            ["Size"] = v_u_191.Size * 6,
                            ["Transparency"] = 0.3
                        })
                        v192:Play()
                        v192:Destroy()
                        task.wait(0.3)
                        local v193 = v_u_2:Create(v_u_191, TweenInfo.new(1, Enum.EasingStyle.Exponential), {
                            ["Transparency"] = 1
                        })
                        v193:Play()
                        v193:Destroy()
                    else
                        task.wait(0.5)
                        local v194 = v_u_2:Create(v_u_191, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                            ["Transparency"] = 1
                        })
                        v194:Play()
                        v194:Destroy()
                    end
                end)
            end
        end
        task.wait(0.5)
        v_u_155.light.Enabled = false
    else
        warn("Invalid combo value:", p_u_152)
    end
end
local v_u_196 = require(v_u_3.rockLines)
local function v_u_205(p197)
    -- upvalues: (copy) v_u_196, (copy) v_u_2
    local v_u_198 = p197.Character
    local v_u_199 = v_u_198.HumanoidRootPart
    task.spawn(function()
        -- upvalues: (copy) v_u_198, (copy) v_u_199, (ref) v_u_196
        for _ = 1, 15 do
            if not v_u_198.Torso:FindFirstChildWhichIsA("BodyVelocity") then
                break
            end
            v_u_196({
                ["StartPos"] = v_u_199.CFrame * CFrame.new(0, 0, 3),
                ["Offset"] = 3,
                ["Amount"] = 1,
                ["Size"] = Vector3.new(1, 1, 1),
                ["Filter"] = { workspace.GarbageCollection },
                ["IterationDelay"] = 0,
                ["Duration"] = 2
            })
            task.wait()
        end
    end)
    task.wait(0.4)
    local v_u_200 = script.surfaceSlash:Clone()
    v_u_200:SetPrimaryPartCFrame(v_u_199.CFrame * CFrame.new(0, 0, -5) * CFrame.Angles(0, 2.443460952792061, 0))
    v_u_200.Parent = workspace.GarbageCollection
    task.wait()
    for _, v_u_201 in pairs(v_u_200:GetDescendants()) do
        if v_u_201:IsA("ParticleEmitter") then
            v_u_201:Emit(40)
        end
        if v_u_201:IsA("MeshPart") then
            task.spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_200, (copy) v_u_201
                local v202 = v_u_2:Create(v_u_200.PrimaryPart, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
                    ["CFrame"] = v_u_200.PrimaryPart.CFrame * CFrame.Angles(0, -2.0943951023931953, 0)
                })
                v202:Play()
                v202:Destroy()
                local v203 = v_u_2:Create(v_u_201, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
                    ["Transparency"] = 1
                })
                v203:Play()
                v203:Destroy()
            end)
        end
    end
    task.wait(0.1)
    v_u_200.PrimaryPart.frontSlash.Slice1.Enabled = false
    game.Debris:AddItem(v_u_200, 3)
    local v204 = v_u_2:Create(v_u_200.Main.light, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
        ["Brightness"] = 0
    })
    v204:Play()
    v204:Destroy()
end
local function v_u_215(p206, p207)
    -- upvalues: (copy) v_u_196, (copy) v_u_2
    local v_u_208 = p206.Character
    local v_u_209 = v_u_208.HumanoidRootPart
    task.spawn(function()
        -- upvalues: (copy) v_u_208, (copy) v_u_209, (ref) v_u_196
        for _ = 1, 15 do
            if not v_u_208.Torso:FindFirstChildWhichIsA("BodyVelocity") then
                break
            end
            v_u_196({
                ["StartPos"] = v_u_209.CFrame * CFrame.new(0, 0, 3),
                ["Offset"] = 3,
                ["Amount"] = 1,
                ["Size"] = Vector3.new(1, 1, 1),
                ["Filter"] = { workspace.GarbageCollection },
                ["IterationDelay"] = 0,
                ["Duration"] = 2
            })
            task.wait()
        end
    end)
    if p207 == true then
        task.wait()
    else
        task.wait(0.4)
    end
    local v_u_210 = script.moonMeshSlash:Clone()
    v_u_210.Second.Color = Color3.new(0.819608, 0.278431, 1)
    v_u_210:SetPrimaryPartCFrame(v_u_209.CFrame * CFrame.new(0, 0, -5) * CFrame.Angles(0, 2.443460952792061, 0))
    v_u_210.Parent = workspace.GarbageCollection
    task.wait()
    for _, v_u_211 in pairs(v_u_210:GetDescendants()) do
        if v_u_211:IsA("ParticleEmitter") then
            v_u_211:Emit(math.random(10, 40))
        end
        if v_u_211:IsA("MeshPart") then
            task.spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_210, (copy) v_u_211
                local v212 = v_u_2:Create(v_u_210.PrimaryPart, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
                    ["CFrame"] = v_u_210.PrimaryPart.CFrame * CFrame.Angles(0, -2.0943951023931953, 0)
                })
                v212:Play()
                v212:Destroy()
                task.wait(0.1)
                local v213 = v_u_2:Create(v_u_211, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
                    ["Transparency"] = 1
                })
                v213:Play()
                v213:Destroy()
            end)
        end
    end
    task.wait(0.1)
    game.Debris:AddItem(v_u_210, 3)
    local v214 = v_u_2:Create(v_u_210.Main.light, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
        ["Brightness"] = 0
    })
    v214:Play()
    v214:Destroy()
end
local function v_u_226(p216, p217)
    -- upvalues: (copy) v_u_196, (copy) v_u_2
    local v_u_218 = p216.Character
    local v_u_219 = v_u_218.HumanoidRootPart
    task.spawn(function()
        -- upvalues: (copy) v_u_218, (copy) v_u_219, (ref) v_u_196
        for _ = 1, 15 do
            if not v_u_218.Torso:FindFirstChildWhichIsA("BodyVelocity") then
                break
            end
            v_u_196({
                ["StartPos"] = v_u_219.CFrame * CFrame.new(0, 0, 3),
                ["Offset"] = 3,
                ["Amount"] = 1,
                ["Size"] = Vector3.new(1, 1, 1),
                ["Filter"] = { workspace.GarbageCollection },
                ["IterationDelay"] = 0,
                ["Duration"] = 2
            })
            task.wait()
        end
    end)
    if p217 == true then
        task.wait()
    else
        task.wait(0.4)
    end
    local v_u_220 = script.moonBlueSurf:Clone()
    v_u_220:SetPrimaryPartCFrame(v_u_219.CFrame * CFrame.new(0, 0, -8) * CFrame.Angles(0, 2.443460952792061, 0))
    v_u_220.Parent = workspace.GarbageCollection
    task.wait()
    for _, v_u_221 in pairs(v_u_220:GetDescendants()) do
        if v_u_221:IsA("ParticleEmitter") then
            v_u_221:Emit(math.random(10, 40))
        end
        if v_u_221:IsA("MeshPart") and v_u_221:IsA("Part") then
            task.spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_220, (copy) v_u_221
                local v222 = v_u_2:Create(v_u_220.PrimaryPart, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
                    ["CFrame"] = v_u_220.PrimaryPart.CFrame * CFrame.Angles(0, -2.0943951023931953, 0)
                })
                v222:Play()
                v222:Destroy()
                task.delay(0.08, function()
                    -- upvalues: (ref) v_u_2, (ref) v_u_220
                    local v223 = v_u_2:Create(v_u_220.PrimaryPart, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
                        ["CFrame"] = v_u_220.PrimaryPart.CFrame * CFrame.Angles(0, -2.0943951023931953, 0)
                    })
                    v223:Play()
                    v223:Destroy()
                end)
                task.wait(0.1)
                local v224 = v_u_2:Create(v_u_221, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
                    ["Transparency"] = 1
                })
                v224:Play()
                v224:Destroy()
            end)
        end
    end
    task.wait(0.1)
    game.Debris:AddItem(v_u_220, 3)
    local v225 = v_u_2:Create(v_u_220.Main.light, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
        ["Brightness"] = 0
    })
    v225:Play()
    v225:Destroy()
end
local function v_u_233(p227, p228)
    local v229 = Instance.new("Weld")
    v229.Part0 = p227
    v229.Part1 = p228
    local v230 = CFrame.new(p227.Position)
    local v231 = p227.CFrame:inverse() * v230
    local v232 = p228.CFrame:inverse() * v230
    v229.C0 = v231
    v229.C1 = v232
    v229.Parent = p227
end
local function v_u_255(p234)
    -- upvalues: (copy) v_u_3, (copy) v_u_196, (copy) v_u_2
    local v_u_235 = p234.Character
    local v236 = v_u_235.HumanoidRootPart
    local v237 = v_u_3.attackTrail:Clone()
    v237.Position = v236.Position
    v237.Parent = workspace.GarbageCollection
    game.Debris:AddItem(v237, 5)
    v237.waterTrail.Enabled = true
    local v_u_238 = script["2ndAir"]:Clone()
    v_u_238.CFrame = v236.CFrame
    v_u_238.Parent = workspace.GarbageCollection
    v_u_238.Attachment.Wind.Enabled = true
    v_u_238.Attachment.Wind2.Enabled = true
    v_u_238.Anchored = false
    task.spawn(function()
        -- upvalues: (copy) v_u_238
        v_u_238.Attachment.Slash.Enabled = true
        task.wait(1.5)
        if v_u_238:FindFirstChild("Attachment") then
            v_u_238.Attachment.Slash.Enabled = false
        end
    end)
    local v_u_239 = Instance.new("Weld")
    v_u_239.Part0 = v236
    v_u_239.Part1 = v_u_238
    v_u_239.C0 = CFrame.new(0, 0, 0)
    v_u_239.Parent = v_u_238
    task.spawn(function()
        -- upvalues: (copy) v_u_238, (copy) v_u_235, (copy) v_u_239
        while v_u_238:FindFirstChild("Wheel1") and v_u_238.Wheel1.Transparency ~= 1 do
            if v_u_238.Wheel1.Transparency > 0.5 or not v_u_235.Torso:FindFirstChild("waterWheelForward") then
                local v240 = v_u_239
                v240.C1 = v240.C1 * CFrame.Angles(0.1, 0, 0)
            else
                local v241 = v_u_239
                v241.C1 = v241.C1 * CFrame.Angles(0.6, 0, 0)
            end
            task.wait()
        end
    end)
    for _ = 1, 95 do
        v_u_196({
            ["StartPos"] = v236.CFrame * CFrame.new(0, 0, 3),
            ["Offset"] = 3,
            ["Amount"] = 1,
            ["Size"] = Vector3.new(0.5, 0.5, 0.5),
            ["Filter"] = { workspace.GarbageCollection },
            ["IterationDelay"] = 0,
            ["Duration"] = 1
        })
        local v242 = v236.CFrame.Position
        local v243 = CFrame.new(v242).UpVector * -10
        local v244 = RaycastParams.new()
        v244.FilterDescendantsInstances = { v_u_235, workspace.Live, workspace.GarbageCollection } or workspace.GarbageCollection
        v244.FilterType = Enum.RaycastFilterType.Exclude
        v244.IgnoreWater = true
        local v245 = game.Workspace:Raycast(v242, v243, v244)
        if v245 then
            local v246 = v245.Instance or nil
            local v247 = v245.Position or nil
            local _ = v245.Normal or nil
            if v246 then
                v237.Position = v247
            end
        end
        task.wait()
    end
    task.wait()
    for _, v_u_248 in pairs(v_u_238:GetDescendants()) do
        if v_u_248.Name == "Foam" then
            v_u_248.Enabled = false
            task.wait()
            v_u_248:Emit(12)
        elseif v_u_248.Name == "Wind" or v_u_248.Name == "Wind2" then
            task.spawn(function()
                -- upvalues: (copy) v_u_248
                task.wait(0.6)
                v_u_248.Enabled = false
            end)
        elseif v_u_248:IsA("ParticleEmitter") and (v_u_248.Name ~= "Foam" and v_u_248.Name ~= "Slice1") then
            v_u_248:Emit(15)
        elseif v_u_248.Name == "Wheel" or (v_u_248.Name == "Wheel1" or v_u_248.Name == "Wheel2") then
            task.spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_248
                local v249 = v_u_2:Create(v_u_248, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                    ["Size"] = v_u_248.Size * 1.4,
                    ["Transparency"] = 1
                })
                v249:Play()
                v249:Destroy()
            end)
        end
    end
    task.wait()
    local v250 = script.groundSmoke:Clone()
    v250.CFrame = v236.CFrame * CFrame.new(0, -1, 0)
    v250.Parent = workspace.GarbageCollection
    game.Debris:AddItem(v250, 5)
    local v251 = { ColorSequenceKeypoint.new(0, Color3.new(0, 0.733333, 1)), ColorSequenceKeypoint.new(1, Color3.new(0, 0.4, 1)) }
    for _, v252 in pairs(v250.Attachment:GetChildren()) do
        v252.Brightness = 25
        v252.Color = ColorSequence.new(v251)
        v252:Emit(10)
    end
    local v253 = v_u_2:Create(v237.light, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
        ["Brightness"] = 0
    })
    v253:Play()
    v253:Destroy()
    local v254 = v_u_2:Create(v_u_238.light, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
        ["Brightness"] = 0
    })
    v254:Play()
    v254:Destroy()
    game.Debris:AddItem(v_u_238, 1)
end
local function v_u_260(p256, p257, p258, p259)
    -- upvalues: (copy) v_u_196
    v_u_196({
        ["StartPos"] = p256.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0),
        ["Offset"] = p257,
        ["Amount"] = p258,
        ["Size"] = Vector3.new(1, 1, 1),
        ["Filter"] = { workspace.GarbageCollection },
        ["IterationDelay"] = p259,
        ["Duration"] = 1
    })
end
local function v_u_273(p261)
    -- upvalues: (copy) v_u_2
    local v262 = p261.Character.HumanoidRootPart
    local v_u_263 = game.ReplicatedStorage.Assets.flowCut:Clone()
    local v264 = v262.CFrame * CFrame.new(math.random(-5, 5), math.random(1, 3), math.random(-5, 5))
    local v265 = CFrame.Angles
    local v266 = math.random(-180, 180)
    local v267 = math.rad(v266)
    local v268 = math.random(-360, 360)
    local v269 = math.rad(v268)
    local v270 = math.random(-180, 180)
    v_u_263.CFrame = v264 * v265(v267, v269, (math.rad(v270)))
    v_u_263.Parent = workspace.GarbageCollection
    v_u_263.Size = Vector3.new(13, 2, 13)
    task.spawn(function()
        -- upvalues: (copy) v_u_263
        for _, v271 in pairs(v_u_263:GetChildren()) do
            if v271:IsA("ParticleEmitter") then
                v271:Emit(v271:GetAttribute("EmitCount"))
            end
        end
    end)
    if math.random(1, 2) == 1 then
        v_u_263.Color = Color3.new(0, 0.701961, 1)
    else
        v_u_263.Color = Color3.new(0.0196078, 0.317647, 0.866667)
    end
    local v272 = v_u_2:Create(v_u_263, TweenInfo.new(0.35, Enum.EasingStyle.Linear), {
        ["Size"] = v_u_263.Size * 1.5,
        ["CFrame"] = v_u_263.CFrame * CFrame.Angles(0, 360, 0),
        ["Transparency"] = 1
    })
    v272:Play()
    v272:Destroy()
    game.Debris:AddItem(v_u_263, 0.45)
end
local function v_u_282(p274)
    local v275 = p274.Character
    local v276 = v275.HumanoidRootPart
    local v277 = script.Anims.flowclone:FindFirstChild("Flowing" .. math.random(1, 4))
    v275.Archivable = true
    local v278 = v275:Clone()
    v278.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    v278.Parent = workspace.GarbageCollection
    v278.Humanoid:LoadAnimation(v277):Play()
    v278:SetPrimaryPartCFrame(v276.CFrame * CFrame.new(0, 0, 1))
    local v279 = script.Dash:Clone()
    v279.Parent = v278.HumanoidRootPart
    v279:Play()
    local v280 = v278:FindFirstChild("KatanaBlade").Blade
    v280.waterTrail.Enabled = false
    v280.waterFoam.Enabled = false
    v280.Foam.Enabled = false
    for _, v281 in pairs(v278:GetDescendants()) do
        if v281:IsA("BasePart") and v281.Name ~= "HumanoidRootPart" or (v281:IsA("Decal") or v281:IsA("MeshPart")) then
            v281.Transparency = math.random()
        end
    end
    game.Debris:AddItem(v278, 2)
end
local function v_u_289(p283, _, p284, p285, p286, p287, p288)
    -- upvalues: (copy) v_u_16
    v_u_16({
        ["Origin"] = p283.Character.HumanoidRootPart.CFrame * CFrame.new(0, -0.5, 0),
        ["Radius"] = p284,
        ["Amount"] = p285,
        ["Size"] = p286,
        ["Lifetime"] = p287,
        ["Collision"] = p288
    })
end
local function v_u_292(p290)
    -- upvalues: (copy) v_u_196
    local v291 = p290.Character.HumanoidRootPart
    for _ = 1, 25 do
        v_u_196({
            ["StartPos"] = v291.CFrame * CFrame.new(0, 0, -10),
            ["Offset"] = 5,
            ["Amount"] = 1,
            ["Size"] = Vector3.new(1, 2.2, 2.2),
            ["Filter"] = { workspace.GarbageCollection },
            ["IterationDelay"] = 0.05,
            ["Duration"] = 5
        })
        task.wait()
    end
end
local function v_u_298(p293, p_u_294)
    -- upvalues: (copy) v_u_3, (copy) v_u_2
    local _ = p293.Character.HumanoidRootPart
    for _ = 1, 15 do
        for _ = 1, 2 do
            local v_u_295
            if math.random(1, 2) == 1 then
                v_u_295 = v_u_3.SlashEffect:clone()
                v_u_295.ParticleEmitter.Enabled = true
                local v296 = script.water1SFX:Clone()
                v296.Parent = v_u_295
                v296:Play()
                local v297 = script.waveSFX:Clone()
                v297.Parent = v_u_295
                v297:Play()
            else
                v_u_295 = v_u_3.flowCut:clone()
                v_u_295.Size = Vector3.new(10, 1, 10)
                v_u_295.waterFoam:Emit(30)
            end
            if math.random(1, 3) == 2 then
                v_u_295.Color = Color3.new(0.32549, 0.67451, 0.862745)
            elseif math.random(1, 3) == 1 then
                v_u_295.Color = Color3.new(0.00784314, 0.376471, 0.862745)
            else
                v_u_295.Color = Color3.new(1, 1, 1)
            end
            v_u_295.CFrame = p_u_294 * CFrame.new(0, -1, -4) * CFrame.Angles(0, 0, 0)
            v_u_295.Size = v_u_295.Size * math.random(1, 3) / 2
            v_u_295.Transparency = 1
            v_u_295.Parent = game.Workspace.GarbageCollection
            v_u_2:Create(v_u_295, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut, 0, true), {
                ["Transparency"] = 0.6
            }):Play()
            task.spawn(function()
                -- upvalues: (ref) v_u_2, (ref) v_u_295, (copy) p_u_294
                v_u_2:Create(v_u_295, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 1), {
                    ["CFrame"] = p_u_294 * CFrame.new(math.random(-5, -5), math.random(-3, 50), 0) * CFrame.Angles(0, math.random(-1300, 1300), 0)
                }):Play()
            end)
            task.spawn(function()
                -- upvalues: (ref) v_u_295
                task.wait(0.6)
                if v_u_295:FindFirstChild("ParticleEmitter") then
                    v_u_295.ParticleEmitter.Enabled = false
                end
            end)
            game.Debris:AddItem(v_u_295, 1.2)
        end
        task.wait(0.1)
    end
end
local v_u_299 = {}
local v_u_300 = game:GetService("TweenService")
local v_u_301 = Random.new()
function v_u_299.Drip(p302, p303, p304, ...)
    -- upvalues: (copy) v_u_301, (copy) v_u_300
    local _ = p302.Character.HumanoidRootPart
    local v305 = RaycastParams.new()
    v305.FilterType = Enum.RaycastFilterType.Exclude
    v305.FilterDescendantsInstances = { ... }
    local v306 = game.Workspace:Raycast(p303, Vector3.new(0, -50, 0), v305)
    if v306 then
        local v307 = v306.Position
        local v_u_308 = script.waterDrip:Clone()
        v_u_308.Parent = game.Workspace.GarbageCollection
        v_u_308.Position = p303
        local v_u_309 = v_u_301:NextNumber(0.5, p304 or 2)
        local v310 = (v_u_308.Position - v307).Magnitude / 50
        v_u_300:Create(v_u_308, TweenInfo.new(0.1, Enum.EasingStyle.Back), {
            ["Size"] = Vector3.new(v_u_309, v_u_309, v_u_309)
        }):Play()
        v_u_300:Create(v_u_308, TweenInfo.new(v310, Enum.EasingStyle.Linear), {
            ["CFrame"] = CFrame.new(v307, v307 + v306.Normal)
        }):Play()
        v_u_308.splash:Play()
        task.delay(v310, function()
            -- upvalues: (ref) v_u_300, (copy) v_u_308, (copy) v_u_309, (ref) v_u_301
            local v311 = v_u_300
            local v312 = v_u_308
            local v313 = TweenInfo.new(0.2, Enum.EasingStyle.Back)
            local v314 = {}
            local v315 = v_u_309 * 2
            local v316 = v_u_309 * 2
            local v317 = v_u_309 / 3
            v314.Size = Vector3.new(v315, v316, v317)
            v311:Create(v312, v313, v314):Play()
            local v318 = v_u_308
            local v319 = v_u_308.Orientation.X
            local v320 = v_u_308.Orientation.Y
            local v321 = v_u_301
            v318.Orientation = Vector3.new(v319, v320, v321:NextNumber(-360, 360))
        end)
        task.delay(3, function()
            -- upvalues: (ref) v_u_300, (copy) v_u_308
            task.delay(1, function()
                -- upvalues: (ref) v_u_300, (ref) v_u_308
                v_u_300:Create(v_u_308, TweenInfo.new(1), {
                    ["Color"] = Color3.fromRGB(0, 0, 0)
                }):Play()
                v_u_300:Create(v_u_308, TweenInfo.new(2, Enum.EasingStyle.Cubic), {
                    ["Size"] = Vector3.new(0.1, 0.1, 0.1)
                }):Play()
                game.Debris:AddItem(v_u_308, 2)
                task.wait(0.5)
                for _, v322 in pairs(v_u_308:GetChildren()) do
                    if v322:IsA("ParticleEmitter") then
                        v322:Emit(4)
                    end
                end
            end)
        end)
    end
end
function v_u_299.Splash(p323, p324, p325, p326)
    -- upvalues: (copy) v_u_301, (copy) v_u_300
    local _ = p323.Character.HumanoidRootPart
    local v327 = p326 or 2
    local v328 = p325 or 25
    local v329 = RaycastParams.new()
    v329.FilterDescendantsInstances = { workspace.Live, workspace.GarbageCollection }
    local v330 = game.Workspace
    local v331 = v_u_301:NextNumber(-v328, v328)
    local v332 = v_u_301
    local v333 = -v328
    local v334 = v330:Raycast(p324 + Vector3.new(v331, 0, v332:NextNumber(v333, v328)), Vector3.new(0, -100, 0), v329)
    if v334 then
        local v335 = p324 + (v334.Position - p324) * 0.5
        local v336 = (p324 - v334.Position).Magnitude * 2
        local v337 = v335 + Vector3.new(0, v336, 0)
        local v_u_338 = script.waterDrip:Clone()
        v_u_338.Parent = game.Workspace
        v_u_338.Position = p324
        local v339 = v_u_301:NextNumber(-360, 360)
        local v340 = v_u_301:NextNumber(-360, 360)
        local v341 = v_u_301
        v_u_338.Rotation = Vector3.new(v339, v340, v341:NextNumber(-360, 360))
        local v342 = v_u_301:NextNumber(0.5, v327)
        v_u_300:Create(v_u_338, TweenInfo.new(0.1, Enum.EasingStyle.Back), {
            ["Size"] = Vector3.new(v342, v342, v342)
        }):Play()
        local v343 = (v_u_338.Position - v334.Position).Magnitude / 2000
        for v344 = 0, 1.05, 0.05 do
            task.wait(v343)
            local v345 = v_u_300
            local v346 = TweenInfo.new(v343)
            local v347 = {}
            local v348 = v334.Position
            local v349 = p324 + (v348 - p324) * v344
            v347.Position = v349 + (v337 + (v348 - v337) * v344 - v349) * v344
            v345:Create(v_u_338, v346, v347):Play()
        end
        local v350 = CFrame.new(v334.Position, v334.Position + v334.Normal)
        local v351 = CFrame.fromEulerAnglesXYZ
        local v352 = v_u_301:NextNumber(-360, 360)
        v_u_338.CFrame = v350 * v351(0, 0, (math.rad(v352)))
        local v353 = v_u_300
        local v354 = TweenInfo.new(0.2, Enum.EasingStyle.Back)
        local v355 = {}
        local v356 = v342 * 2
        local v357 = v342 * 2
        local v358 = v342 / 3
        v355.Size = Vector3.new(v356, v357, v358)
        v353:Create(v_u_338, v354, v355):Play()
        v_u_338.splash:Play()
        task.delay(3, function()
            -- upvalues: (ref) v_u_300, (copy) v_u_338
            task.delay(1, function()
                -- upvalues: (ref) v_u_300, (ref) v_u_338
                v_u_300:Create(v_u_338, TweenInfo.new(1), {
                    ["Color"] = Color3.fromRGB(0, 0, 0)
                }):Play()
                v_u_300:Create(v_u_338, TweenInfo.new(2, Enum.EasingStyle.Cubic), {
                    ["Size"] = Vector3.new(0.1, 0.1, 0.1)
                }):Play()
                game.Debris:AddItem(v_u_338, 2)
                task.wait(0.5)
                for _, v359 in pairs(v_u_338:GetChildren()) do
                    if v359:IsA("ParticleEmitter") then
                        v359:Emit(6)
                    end
                end
            end)
        end)
    end
end
function v_u_299.bloodSplash(p360, p361, p362, p363, p364)
    -- upvalues: (copy) v_u_301, (copy) v_u_300
    if game.ReplicatedStorage.Tags:FindFirstChild("bloodEnable") then
        local _ = p360.HumanoidRootPart
        local v365 = p363 or 2
        local v366 = p362 or 25
        local v367 = RaycastParams.new()
        v367.FilterDescendantsInstances = { workspace.Live, workspace.GarbageCollection }
        local v368 = game.Workspace
        local v369 = v_u_301:NextNumber(-v366, v366)
        local v370 = v_u_301
        local v371 = -v366
        local v372 = v368:Raycast(p361 + Vector3.new(v369, 0, v370:NextNumber(v371, v366)), Vector3.new(0, -100, 0), v367)
        if v372 then
            local v373 = p361 + (v372.Position - p361) * 0.5
            local v374 = (p361 - v372.Position).Magnitude * 2
            local v375 = v373 + Vector3.new(0, v374, 0)
            local v_u_376 = script.bloodDrip:Clone()
            v_u_376.Parent = game.Workspace
            v_u_376.Position = p361
            local v377 = v_u_301:NextNumber(-360, 360)
            local v378 = v_u_301:NextNumber(-360, 360)
            local v379 = v_u_301
            v_u_376.Rotation = Vector3.new(v377, v378, v379:NextNumber(-360, 360))
            task.spawn(function()
                -- upvalues: (copy) v_u_376
                game.Debris:AddItem(v_u_376, 8)
            end)
            if p364 ~= nil and (p364:FindFirstChild("PlayerGui") and (p364.PlayerGui:FindFirstChild("consoleGui") or p364.PlayerGui:FindFirstChild("ps4Gui"))) then
                v_u_376.Color = Color3.new(1, 1, 1)
            end
            local v380 = v_u_301:NextNumber(0.5, v365)
            v_u_300:Create(v_u_376, TweenInfo.new(0.1, Enum.EasingStyle.Back), {
                ["Size"] = Vector3.new(v380, v380, v380)
            }):Play()
            local v381 = (v_u_376.Position - v372.Position).Magnitude / 2000
            for v382 = 0, 1.05, 0.05 do
                task.wait(v381)
                local v383 = v_u_300
                local v384 = TweenInfo.new(v381)
                local v385 = {}
                local v386 = v372.Position
                local v387 = p361 + (v386 - p361) * v382
                v385.Position = v387 + (v375 + (v386 - v375) * v382 - v387) * v382
                v383:Create(v_u_376, v384, v385):Play()
            end
            local v388 = CFrame.new(v372.Position, v372.Position + v372.Normal)
            local v389 = CFrame.fromEulerAnglesXYZ
            local v390 = v_u_301:NextNumber(-360, 360)
            v_u_376.CFrame = v388 * v389(0, 0, (math.rad(v390)))
            local v391 = v_u_300
            local v392 = TweenInfo.new(0.2, Enum.EasingStyle.Back)
            local v393 = {}
            local v394 = v380 * 2
            local v395 = v380 * 2
            local v396 = v380 / 3
            v393.Size = Vector3.new(v394, v395, v396)
            v391:Create(v_u_376, v392, v393):Play()
            v_u_376.splash:Play()
            task.delay(3, function()
                -- upvalues: (ref) v_u_300, (copy) v_u_376
                task.delay(1, function()
                    -- upvalues: (ref) v_u_300, (ref) v_u_376
                    v_u_300:Create(v_u_376, TweenInfo.new(1), {
                        ["Color"] = Color3.fromRGB(0, 0, 0)
                    }):Play()
                    v_u_300:Create(v_u_376, TweenInfo.new(2, Enum.EasingStyle.Cubic), {
                        ["Size"] = Vector3.new(0.1, 0.1, 0.1)
                    }):Play()
                    game.Debris:AddItem(v_u_376, 2)
                    task.wait(0.5)
                end)
            end)
        end
    end
end
local function v_u_399(p_u_397)
    -- upvalues: (copy) v_u_3, (copy) v_u_2
    for _ = 1, 9 do
        local v_u_398
        if math.random(1, 2) == 1 then
            v_u_398 = v_u_3.SlashEffect:clone()
        else
            v_u_398 = v_u_3.flowCut:clone()
            v_u_398.Size = Vector3.new(10, 1, 10)
            v_u_398.waterFoam:Emit(1)
        end
        if math.random(1, 3) == 2 then
            v_u_398.Color = Color3.new(0.32549, 0.67451, 0.862745)
        elseif math.random(1, 3) == 1 then
            v_u_398.Color = Color3.new(0.862745, 0.501961, 0)
        else
            v_u_398.Color = Color3.new(1, 1, 1)
        end
        task.delay(1, function()
            -- upvalues: (ref) v_u_398
            v_u_398.Color = Color3.new(0.862745, 0.501961, 0)
        end)
        v_u_398.CFrame = p_u_397 * CFrame.new(math.random(-10, 10), -1, math.random(-10, 10)) * CFrame.Angles(0, 0, 0)
        v_u_398.Size = v_u_398.Size * math.random(1, 3) / 2
        v_u_398.Transparency = 1
        v_u_398.Parent = game.Workspace.GarbageCollection
        v_u_2:Create(v_u_398, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut, 0, true), {
            ["Transparency"] = 0.6
        }):Play()
        task.spawn(function()
            -- upvalues: (ref) v_u_2, (ref) v_u_398, (copy) p_u_397
            v_u_2:Create(v_u_398, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 1), {
                ["CFrame"] = p_u_397 * CFrame.new(0, math.random(-3, 15), 0) * CFrame.Angles(0, math.random(-1300, 1300), 0)
            }):Play()
        end)
        task.spawn(function()
            -- upvalues: (ref) v_u_398
            task.wait(0.6)
            if v_u_398:FindFirstChild("ParticleEmitter") then
                v_u_398.ParticleEmitter.Enabled = false
            end
        end)
        game.Debris:AddItem(v_u_398, 1.2)
        task.wait(0.1)
    end
end
local function v_u_420(p_u_400, p401)
    -- upvalues: (copy) v_u_2, (copy) v_u_299
    local v_u_402 = script.fluxExplode:Clone()
    v_u_402:SetPrimaryPartCFrame(p401)
    v_u_402.Parent = workspace.GarbageCollection
    task.spawn(function()
        -- upvalues: (copy) v_u_402, (ref) v_u_2, (ref) v_u_299, (copy) p_u_400
        for _, v_u_403 in pairs(v_u_402.middle:GetChildren()) do
            v_u_403.Enabled = true
            task.delay(0.3, function()
                -- upvalues: (copy) v_u_403
                v_u_403.Enabled = false
            end)
        end
        for _, v_u_404 in pairs(v_u_402:GetChildren()) do
            local v405 = v_u_2
            local v406 = TweenInfo.new(0.4, Enum.EasingStyle.Quad)
            local v407 = {}
            local v408 = v_u_404.CFrame
            local v409 = CFrame.Angles
            local v410 = math.random(-3600, 3600)
            v407.CFrame = v408 * v409(0, math.rad(v410), 0)
            v407.Transparency = 0.5
            v407.Size = v_u_404.Size * 6
            local v411 = v405:Create(v_u_404, v406, v407)
            v411:Play()
            v411:Destroy()
            task.delay(0.63, function()
                -- upvalues: (copy) v_u_404, (ref) v_u_2, (ref) v_u_402, (ref) v_u_299, (ref) p_u_400
                if v_u_404.Name == "Part" then
                    v_u_404.Foam.Rate = 5
                    v_u_404.Foam.Enabled = false
                end
                local v412 = v_u_2
                local v413 = v_u_404
                local v414 = TweenInfo.new(0.6, Enum.EasingStyle.Quad)
                local v415 = {}
                local v416 = v_u_404.CFrame
                local v417 = CFrame.Angles
                local v418 = math.random(-3600, 3600)
                v415.CFrame = v416 * v417(0, math.rad(v418), 0)
                v415.Transparency = 1
                v415.Size = Vector3.new(5, 1, 5)
                local v419 = v412:Create(v413, v414, v415)
                v419:Play()
                v419:Destroy()
                task.delay(0.05, function()
                    -- upvalues: (ref) v_u_402, (ref) v_u_299, (ref) p_u_400, (ref) v_u_404
                    game.Debris:AddItem(v_u_402, 0.3)
                    v_u_299.Splash(p_u_400, v_u_404.Position, 3, math.random(10, 20))
                end)
            end)
        end
    end)
end
local function v_u_470(p_u_421, p_u_422, p_u_423)
    -- upvalues: (copy) v_u_299, (copy) v_u_2, (copy) v_u_420, (copy) v_u_16
    local _ = p_u_421.Character.HumanoidRootPart
    local v_u_424 = math.random(5, 30)
    local v_u_425 = math.random(10, 60)
    local v_u_442, v_u_443, v_u_444, v_u_445 = (function()
        -- upvalues: (copy) p_u_423, (copy) v_u_425, (copy) v_u_424, (copy) p_u_422
        local v426 = p_u_423
        local v427 = math.random(-1, 1)
        local v428 = math.random
        local v429 = v426 + Vector3.new(v427, 0, v428(-1, 1))
        local v430 = v429.X
        local v431 = workspace:Raycast(v429 + Vector3.new(0, 200, 0), Vector3.new(0, -500, 0))
        local v432
        if v431 then
            v432 = v431.Position.Y
        else
            v432 = nil
        end
        local v433 = v429.Z
        local v434 = Vector3.new(v430, v432, v433)
        local v435 = v434.X + math.random(-v_u_425, v_u_425)
        local v436 = v434.Y + v_u_424
        local v437 = v434.Z + math.random(-v_u_425, v_u_425)
        local v438 = Vector3.new(v435, v436, v437)
        local v439 = v438.X + math.random(-100, 100)
        local v440 = v438.Y + math.random(-15, 15)
        local v441 = v438.Z + math.random(-100, 100)
        return v434, v438, Vector3.new(v439, v440, v441), p_u_422
    end)()
    local v_u_446 = Instance.new("Folder")
    v_u_446.Parent = workspace.GarbageCollection
    local v_u_447 = script.dragonHead:Clone()
    v_u_447.Position = v_u_442
    v_u_447.Parent = v_u_446
    v_u_447.roar1SFX:Play()
    v_u_447.roar2SFX:Play()
    local v_u_448 = Instance.new("NumberValue")
    v_u_448.Value = 0
    v_u_448.Parent = v_u_446
    local v467 = v_u_448.Changed:Connect(function()
        -- upvalues: (copy) v_u_446, (copy) v_u_447, (ref) v_u_299, (copy) p_u_421, (ref) v_u_2, (copy) v_u_448, (copy) v_u_442, (copy) v_u_443, (copy) v_u_444, (copy) v_u_445
        local v_u_449 = script.dragonTail:Clone()
        v_u_449.Parent = v_u_446
        v_u_449.CFrame = v_u_447.CFrame * CFrame.Angles(0, 1.5707963267948966, -1.5707963267948966)
        task.spawn(function()
            -- upvalues: (ref) v_u_299, (ref) p_u_421, (copy) v_u_449, (ref) v_u_2
            v_u_299.Drip(p_u_421, v_u_449.Position + Vector3.new(0, -10, 0), math.random(1, 4))
            task.delay(0.7, function()
                -- upvalues: (ref) v_u_449, (ref) v_u_2
                v_u_449.Material = "Glass"
                task.spawn(function()
                    -- upvalues: (ref) v_u_449, (ref) v_u_2
                    for _, v450 in pairs(v_u_449:GetChildren()) do
                        v450.Material = "Glass"
                        local v451 = v_u_2:Create(v450, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                            ["Transparency"] = 1
                        })
                        v451:Play()
                        v451:Destroy()
                    end
                end)
                local v452 = v_u_2:Create(v_u_449, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                    ["Transparency"] = 1
                })
                v452:Play()
                v452:Destroy()
                game.Debris:AddItem(v_u_449, 0.6)
            end)
        end)
        local v453 = v_u_447
        local v454 = CFrame.new
        local v455 = v_u_448.Value
        local v456 = v_u_442
        local v457 = v_u_443
        local v458 = v_u_444
        local v459 = v_u_445
        v453.CFrame = v454((1 - v455) ^ 3 * v456 + 3 * (1 - v455) ^ 2 * v455 * v457 + 3 * (1 - v455) * v455 ^ 2 * v458 + v455 ^ 3 * v459)
        local v460 = v_u_447.Position
        local v461 = v_u_448.Value + 0.1
        local v462 = v_u_442
        local v463 = v_u_443
        local v464 = v_u_444
        local v465 = v_u_445
        local v466 = (1 - v461) ^ 3 * v462 + 3 * (1 - v461) ^ 2 * v461 * v463 + 3 * (1 - v461) * v461 ^ 2 * v464 + v461 ^ 3 * v465
        v_u_447.CFrame = CFrame.lookAt(v460, v466)
    end)
    v_u_2:Create(v_u_448, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
        ["Value"] = 1
    }):Play()
    task.wait(1)
    if v467 then
        v_u_420(p_u_421, v_u_447.CFrame * CFrame.new(0, 5, 0))
        task.spawn(function()
            -- upvalues: (copy) v_u_447
            for _, v468 in pairs(script.groundSFX:GetChildren()) do
                local v_u_469 = v468:Clone()
                v_u_469.Parent = v_u_447
                v_u_469:Play()
                task.delay(2, function()
                    -- upvalues: (copy) v_u_469
                    v_u_469:Destroy()
                end)
            end
        end)
        task.spawn(function()
            -- upvalues: (copy) v_u_447, (ref) v_u_16
            v_u_16({
                ["Origin"] = v_u_447.CFrame,
                ["Radius"] = 30,
                ["Amount"] = 10,
                ["Size"] = Vector3.new(5, 5, 5),
                ["Lifetime"] = 3.5,
                ["Collision"] = false
            })
        end)
        print("hit!")
        v467:Disconnect()
    end
    game.Debris:AddItem(v_u_446, 5)
    v_u_447.Material = "Glass"
    v_u_447.Fin.Material = "Glass"
    v_u_2:Create(v_u_447, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        ["Transparency"] = 1
    }):Play()
    v_u_2:Create(v_u_447.Fin, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        ["Transparency"] = 1
    }):Play()
end
local v_u_471 = false
local function v_u_508(p_u_472)
    -- upvalues: (copy) v_u_2, (ref) v_u_471
    if not p_u_472:FindFirstChild("Susanoo") then
        p_u_472 = p_u_472.Character
    end
    local v_u_473 = p_u_472.HumanoidRootPart
    local v_u_474 = script.dashSmoke:Clone()
    v_u_474.Parent = workspace.GarbageCollection
    v_u_474.CFrame = v_u_473.CFrame * CFrame.new(0, -2.5, 0)
    v_u_474.dirt1:Play()
    v_u_474.dirt2:Play()
    task.spawn(function()
        -- upvalues: (copy) v_u_474, (copy) v_u_473
        for _, v475 in pairs(v_u_474.Attachment:GetChildren()) do
            v475:Emit(5)
            task.wait()
        end
        local v476 = script.Burst_1.Attachment:Clone()
        v476.Parent = v_u_473
        for _, v_u_477 in pairs(v476:GetChildren()) do
            v_u_477:Emit(1)
            task.delay(0.23, function()
                -- upvalues: (copy) v_u_477
                v_u_477.LockedToPart = false
            end)
        end
        game.Debris:AddItem(v476, 2)
    end)
    if p_u_472:FindFirstChild("KatanaBlade") then
        local v478 = p_u_472:FindFirstChild("KatanaBlade")
        if v478:FindFirstChild("Blade") and v478.Blade:FindFirstChild("normalTrail") then
            v478.Blade.normalTrail.Enabled = false
        end
    elseif p_u_472:FindFirstChild("KokushiboKatanaBlade") then
        local v479 = p_u_472:FindFirstChild("KokushiboKatanaBlade")
        if v479:FindFirstChild("Blade") and v479.Blade:FindFirstChild("normalTrail") then
            v479.Blade.normalTrail.Enabled = false
        end
    end
    game.Debris:AddItem(v_u_474, 2)
    task.spawn(function()
        -- upvalues: (ref) p_u_472, (copy) v_u_473, (ref) v_u_2, (ref) v_u_471
        p_u_472.Archivable = true
        local v_u_480 = p_u_472:clone()
        v_u_480.Parent = game.Lighting
        p_u_472.Archivable = false
        task.spawn(function()
            -- upvalues: (ref) v_u_473, (ref) p_u_472, (ref) v_u_2
            v_u_473.SoruEmit.Enabled = true
            if p_u_472.Head:FindFirstChild("face") then
                p_u_472.Head.face.Transparency = 1
            end
            for _, v_u_481 in pairs(p_u_472:GetDescendants()) do
                if v_u_481:IsA("BasePart") or (v_u_481:IsA("Part") or v_u_481:IsA("MeshPart")) then
                    local v482 = v_u_2:Create(v_u_481, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Transparency"] = 1
                    })
                    v482:Play()
                    v482:Destroy()
                elseif v_u_481:IsA("Accessory") then
                    local v483 = v_u_2:Create(v_u_481.Handle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Transparency"] = 1
                    })
                    v483:Play()
                    v483:Destroy()
                end
                if not p_u_472:FindFirstChild("IFrame") then
                    if v_u_481:IsA("Sound") then
                        v_u_481:Stop()
                    elseif v_u_481:IsA("ParticleEmitter") then
                        v_u_481.Enabled = false
                        task.delay(1, function()
                            -- upvalues: (copy) v_u_481
                            if v_u_481.Name == "Insects" or v_u_481.Name == "Insects2" then
                                v_u_481.Enabled = true
                            end
                        end)
                    elseif v_u_481:IsA("Trail") then
                        v_u_481.Enabled = false
                        if v_u_481.Name == "normalTrail" then
                            task.delay(1, function()
                                -- upvalues: (copy) v_u_481
                                v_u_481.Enabled = true
                            end)
                        end
                    elseif v_u_481:IsA("Beam") then
                        v_u_481.Enabled = false
                    elseif v_u_481.Name == "Blade" and v_u_481.Parent:FindFirstChild("normalTrail") then
                        v_u_481.Parent.normalTrail.Enabled = false
                        task.delay(1, function()
                            -- upvalues: (copy) v_u_481
                            v_u_481.Parent.normalTrail.Enabled = true
                        end)
                    end
                end
            end
            task.spawn(function()
                -- upvalues: (ref) v_u_473
                task.wait(0.3)
                v_u_473.SoruEmit.Enabled = false
            end)
            task.wait(1.4)
            task.delay(0.03, function()
                -- upvalues: (ref) p_u_472, (ref) v_u_2
                for _, v_u_484 in pairs(p_u_472:GetDescendants()) do
                    if v_u_484.Name ~= "HumanoidRootPart" then
                        if v_u_484:IsA("BasePart") or (v_u_484:IsA("Part") or v_u_484:IsA("MeshPart")) then
                            if v_u_484.Parent:FindFirstChild("bladeAttach") then
                                local v485 = v_u_2:Create(v_u_484.Parent.Base, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                    ["Transparency"] = 0
                                })
                                v485:Play()
                                v485:Destroy()
                                v_u_484.Parent.Blade.Transparency = 1
                                v_u_484.Parent.Handle.Transparency = 1
                            else
                                local v486 = v_u_2:Create(v_u_484, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                    ["Transparency"] = 0
                                })
                                v486:Play()
                                v486:Destroy()
                            end
                        elseif v_u_484:IsA("Accessory") then
                            local v487 = v_u_2:Create(v_u_484.Handle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                ["Transparency"] = 0
                            })
                            v487:Play()
                            v487:Destroy()
                        end
                        task.delay(0.1, function()
                            -- upvalues: (ref) p_u_472, (copy) v_u_484, (ref) v_u_2
                            if p_u_472["Left Arm"].Transparency == 1 then
                                if v_u_484:IsA("BasePart") or (v_u_484:IsA("Part") or v_u_484:IsA("MeshPart")) then
                                    local v488 = v_u_2:Create(v_u_484, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                        ["Transparency"] = 1
                                    })
                                    v488:Play()
                                    v488:Destroy()
                                    v_u_484.Parent.Blade.Transparency = 1
                                    v_u_484.Parent.Handle.Transparency = 1
                                    return
                                end
                                if v_u_484:IsA("Accessory") then
                                    local v489 = v_u_2:Create(v_u_484.Handle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                        ["Transparency"] = 1
                                    })
                                    v489:Play()
                                    v489:Destroy()
                                end
                            end
                        end)
                    end
                end
            end)
            if p_u_472.Head:FindFirstChild("face") then
                p_u_472.Head.face.Transparency = 0
            end
        end)
        v_u_473.Parent.Archivable = true
        local v_u_490 = v_u_480:clone()
        v_u_490.Parent = workspace.GarbageCollection
        local v491 = v_u_490.HumanoidRootPart
        local v492 = v_u_473.CFrame * CFrame.new(0, math.random(2, 4), 0)
        local v493 = CFrame.Angles
        local v494 = math.random(90, 360)
        local v495 = math.rad(v494)
        local v496 = math.random(90, 360)
        local v497 = math.rad(v496)
        local v498 = math.random(90, 360)
        v491.CFrame = v492 * v493(v495, v497, (math.rad(v498)))
        local v499 = v_u_490.HumanoidRootPart
        v499.CFrame = v499.CFrame * CFrame.new(math.random(4, 4), 0, math.random(4, 4))
        v_u_490.Humanoid:Destroy()
        if v_u_490.Head:FindFirstChild("face") then
            v_u_490.Head.face:Destroy()
        end
        game.Debris:AddItem(v_u_490, 1.8)
        if v_u_490.Head:FindFirstChild("Dodges") then
            v_u_490.Head:FindFirstChild("Dodges"):Destroy()
        end
        p_u_472.Archivable = false
        task.spawn(function()
            -- upvalues: (copy) v_u_490, (ref) v_u_2, (ref) p_u_472
            for _, v_u_500 in pairs(v_u_490:GetDescendants()) do
                if v_u_500:IsA("BasePart") or (v_u_500:IsA("Part") or v_u_500:IsA("MeshPart")) then
                    v_u_500.Color = Color3.new(0.152941, 0.152941, 0.152941)
                    v_u_500.Anchored = true
                    v_u_500.CanCollide = false
                    v_u_500.Material = Enum.Material.Neon
                    local v501 = v_u_2:Create(v_u_500, TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Transparency"] = 1,
                        ["Color"] = Color3.new(1, 1, 1)
                    })
                    v501:Play()
                    v501:Destroy()
                elseif v_u_500:IsA("Accessory") then
                    local v502
                    if v_u_500.Handle:FindFirstChild("Mesh") then
                        v502 = v_u_500.Handle:FindFirstChild("Mesh")
                        v502.TextureId = ""
                        v502.VertexColor = Vector3.new(0.152941, 0.152941, 0.152941)
                    elseif v_u_500.Handle:FindFirstChild("SpecialMesh") then
                        v502 = v_u_500.Handle:FindFirstChild("SpecialMesh")
                        v502.TextureId = ""
                        v502.VertexColor = Vector3.new(0.152941, 0.152941, 0.152941)
                    else
                        v502 = v_u_500.Handle
                        v502.TextureID = ""
                        v502.Color = Color3.new(0.152941, 0.152941, 0.152941)
                    end
                    v_u_500.Handle.Material = Enum.Material.Neon
                    local v503 = v_u_2:Create(v_u_500.Handle, TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Transparency"] = 1
                    })
                    v503:Play()
                    v503:Destroy()
                    if v502.Parent:FindFirstChild("Mesh") or v502.Parent:FindFirstChild("SpecialMesh") then
                        local v504 = v_u_2:Create(v502, TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                            ["VertexColor"] = Vector3.new(1, 1, 1)
                        })
                        v504:Play()
                        v504:Destroy()
                    else
                        local v505 = v_u_2:Create(v502, TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                            ["Color"] = Color3.new(1, 1, 1)
                        })
                        v505:Play()
                        v505:Destroy()
                    end
                elseif v_u_490:FindFirstChild("Susanoo") and v_u_500:IsA("Weld") then
                    v_u_500:Destroy()
                end
                task.spawn(function()
                    -- upvalues: (ref) p_u_472, (copy) v_u_500
                    if not p_u_472:FindFirstChild("IFrame") then
                        if v_u_500:IsA("Sound") then
                            v_u_500:Stop()
                            return
                        end
                        if v_u_500:IsA("ParticleEmitter") then
                            v_u_500.Enabled = false
                            return
                        end
                        if v_u_500:IsA("Trail") then
                            v_u_500.Enabled = false
                            if v_u_500.Name == "normalTrail" then
                                task.delay(1, function()
                                    -- upvalues: (ref) v_u_500
                                    v_u_500.Enabled = true
                                end)
                                return
                            end
                        elseif v_u_500:IsA("Beam") then
                            v_u_500.Enabled = false
                        end
                    end
                end)
            end
        end)
        task.wait(0.04)
        task.delay(0.5, function()
            -- upvalues: (ref) p_u_472, (copy) v_u_480
            if p_u_472:FindFirstChild("KatanaBlade") then
                local v506 = p_u_472:FindFirstChild("KatanaBlade")
                if v506:FindFirstChild("Blade") and v506.Blade:FindFirstChild("normalTrail") then
                    v506.Blade.normalTrail.Enabled = false
                end
            elseif p_u_472:FindFirstChild("KokushiboKatanaBlade") then
                local v507 = p_u_472:FindFirstChild("KokushiboKatanaBlade")
                if v507:FindFirstChild("Blade") and v507.Blade:FindFirstChild("normalTrail") then
                    v507.Blade.normalTrail.Enabled = false
                end
            end
            v_u_480:Destroy()
        end)
        v_u_471 = false
    end)
end
local function v_u_529(p509, _)
    -- upvalues: (copy) v_u_16, (copy) v_u_196, (copy) v_u_2
    local v_u_510 = p509.HumanoidRootPart
    local v511 = Random.new()
    v_u_16({
        ["Origin"] = v_u_510.CFrame * CFrame.new(0, 1, 0),
        ["Radius"] = 10,
        ["Amount"] = 8,
        ["Size"] = Vector3.new(2, 2, 2),
        ["Lifetime"] = 1,
        ["Collision"] = false
    })
    task.spawn(function()
        -- upvalues: (copy) v_u_510, (ref) v_u_196
        local v512 = {
            ["StartPos"] = v_u_510.CFrame * CFrame.new(0, 0, 3),
            ["Offset"] = 7,
            ["Amount"] = 10
        }
        local v513 = math.random(3, 8)
        local v514 = math.random(3, 8)
        local v515 = math.random
        v512.Size = Vector3.new(v513, v514, v515(3, 8))
        v512.Filter = { workspace.GarbageCollection, workspace.Live }
        v512.IterationDelay = 0
        v512.Duration = 1.23
        v_u_196(v512)
    end)
    while p509:FindFirstChild("Rsun") do
        for _ = 1, 10 do
            local v516 = { workspace.GarbageCollection, workspace.Live }
            local v517 = v_u_510.CFrame
            local v518 = RaycastParams.new()
            v518.FilterType = Enum.RaycastFilterType.Exclude
            v518.FilterDescendantsInstances = v516
            local v519 = v517 * CFrame.fromEulerAnglesXYZ(0, 0.5235987755982988, 0) * CFrame.new(8.703703703703702, 10, 0)
            local v_u_520 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local _ = v517 * CFrame.fromEulerAnglesXYZ(0, 0.5235987755982988, 0) * CFrame.new(6, 10, 0)
            local v521 = workspace:Raycast(v519.Position, Vector3.new(0, -20, 0), v518)
            local v_u_522 = Instance.new("Part")
            v_u_522.Name = "debreee"
            task.spawn(function()
                -- upvalues: (copy) v_u_522
                game.Debris:AddItem(v_u_522, 5)
            end)
            v_u_522.Anchored = false
            v_u_522.CanCollide = false
            v_u_522.CanTouch = false
            v_u_522.Material = v521.Material
            v_u_522.BrickColor = BrickColor.new("Reddish brown")
            v_u_522.CFrame = CFrame.new(v517.Position) * CFrame.new(0, math.random(1, 5), 0)
            v_u_522.Size = Vector3.new(2, 2, 2) * v511:NextNumber(-0.5, 3)
            local v523 = math.random(-10, 10)
            local v524 = math.random(-10, 10)
            local v525 = math.random
            v_u_522.RotVelocity = Vector3.new(v523, v524, v525(-10, 10))
            local v526 = math.random(-25, 25)
            local v527 = math.random(30, 125)
            local v528 = math.random
            v_u_522.Velocity = Vector3.new(v526, v527, v528(-25, 25))
            v_u_522.Parent = workspace.GarbageCollection
            task.delay(2, function()
                -- upvalues: (ref) v_u_2, (copy) v_u_522, (copy) v_u_520
                v_u_2:Create(v_u_522, v_u_520, {
                    ["Size"] = Vector3.new(0, 0, 0)
                }):Play()
                game.Debris:AddItem(v_u_522, 0.6)
            end)
            task.wait()
        end
    end
end
local function v_u_542(p530)
    -- upvalues: (copy) v_u_16, (copy) v_u_2
    if not p530:IsA("Model") then
        p530 = p530.Character
    end
    local v_u_531 = p530.HumanoidRootPart
    local v532 = script.AkShockwave:Clone()
    v532:SetPrimaryPartCFrame(p530.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3) * CFrame.Angles(-0.8726646259971648, 0, 1.5707963267948966))
    v532.Parent = workspace.GarbageCollection
    game.Debris:AddItem(v532, 1.5)
    task.delay(0.1, function()
        -- upvalues: (copy) v_u_531, (ref) v_u_16
        local v_u_533 = script.groundSmoke:Clone()
        v_u_533.CFrame = v_u_531.CFrame * CFrame.new(0, -1, 0)
        v_u_533.Parent = workspace.GarbageCollection
        for _, v534 in pairs(v_u_533.Attachment:GetChildren()) do
            v534:Emit(50)
        end
        task.spawn(function()
            -- upvalues: (copy) v_u_533
            for _, v535 in pairs(script.groundSFX:GetChildren()) do
                local v536 = v535:Clone()
                v536.Parent = v_u_533
                v536.Volume = math.random(1, 7) / 10
                v536:Play()
                game.Debris:AddItem(v536, 3)
            end
        end)
        v_u_16({
            ["Origin"] = v_u_531.CFrame * CFrame.new(0, 1, 0),
            ["Radius"] = 10,
            ["Amount"] = 10,
            ["Size"] = Vector3.new(2, 3, 2)
        })
    end)
    for _, v_u_537 in pairs(v532:GetDescendants()) do
        if v_u_537:IsA("ParticleEmitter") then
            v_u_537:Emit(math.random(3, 8))
            if v_u_537.Name == "AmbienceSmoke" or (v_u_537.Name == "RealisticBurst" or v_u_537.Name == "whiteBurst") then
                local v538 = v_u_537.Size
                v_u_537.Size = NumberSequence.new(v538.Keypoints[1].Time * 1.2, v538.Keypoints[1].Value * math.random(5, 8))
            else
                local v539 = v_u_537.Size
                v_u_537.Size = NumberSequence.new(v539.Keypoints[1].Time * 1.2, v539.Keypoints[1].Value * math.random(3, 4))
            end
            task.delay(0.3, function()
                -- upvalues: (copy) v_u_537
                v_u_537.Enabled = false
            end)
        elseif v_u_537:IsA("Sound") then
            task.delay(0, function()
                -- upvalues: (copy) v_u_537
                v_u_537:Play()
                task.wait()
            end)
        elseif v_u_537:IsA("MeshPart") or v_u_537:IsA("Part") then
            task.spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_537
                local v540 = v_u_2:Create(v_u_537, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                    ["Size"] = v_u_537.Size * 5
                })
                v540:Play()
                v540:Destroy()
                task.wait(0.1)
                local v541 = v_u_2:Create(v_u_537, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                    ["Transparency"] = 1
                })
                v541:Play()
                v541:Destroy()
            end)
        end
    end
end
local function v_u_560(p543)
    -- upvalues: (copy) v_u_2
    if not p543:IsA("Model") then
        p543 = p543.Character
    end
    local _ = p543.HumanoidRootPart
    local v544 = script.m1Shockwave:Clone()
    if p543.Combo.Value == 5 then
        local v545 = p543.HumanoidRootPart.CFrame * CFrame.new(0, 0, -9)
        local v546 = CFrame.Angles
        local v547 = math.random(-20, 20)
        local v548 = math.rad(v547)
        local v549 = math.random(-20, 20)
        v544:SetPrimaryPartCFrame(v545 * v546(v548, math.rad(v549), 1.5707963267948966))
    else
        local v550 = p543.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
        local v551 = CFrame.Angles
        local v552 = math.random(-20, 20)
        local v553 = math.rad(v552)
        local v554 = math.random(-20, 20)
        v544:SetPrimaryPartCFrame(v550 * v551(v553, math.rad(v554), 1.5707963267948966))
    end
    v544.Parent = workspace.GarbageCollection
    game.Debris:AddItem(v544, 4)
    for _, v_u_555 in pairs(v544:GetDescendants()) do
        if v_u_555:IsA("ParticleEmitter") then
            v_u_555:Emit(math.random(3, 8))
            if v_u_555.Name == "AmbienceSmoke" or (v_u_555.Name == "RealisticBurst" or v_u_555.Name == "whiteBurst") then
                local v556 = v_u_555.Size
                v_u_555.Size = NumberSequence.new(v556.Keypoints[1].Time * 1.2, v556.Keypoints[1].Value * math.random(3, 5))
            else
                local v557 = v_u_555.Size
                v_u_555.Size = NumberSequence.new(v557.Keypoints[1].Time * 1.2, v557.Keypoints[1].Value * 0.6)
            end
            task.delay(0.3, function()
                -- upvalues: (copy) v_u_555
                v_u_555.Enabled = false
            end)
        elseif v_u_555:IsA("Sound") then
            task.delay(0, function()
                -- upvalues: (copy) v_u_555
                v_u_555:Play()
                task.wait()
            end)
        elseif v_u_555:IsA("MeshPart") or v_u_555:IsA("Part") then
            task.spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_555
                local v558 = v_u_2:Create(v_u_555, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                    ["Size"] = v_u_555.Size * 2
                })
                v558:Play()
                v558:Destroy()
                task.wait(0.1)
                local v559 = v_u_2:Create(v_u_555, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                    ["Transparency"] = 1
                })
                v559:Play()
                v559:Destroy()
            end)
        end
    end
end
local function v_u_567(p561)
    -- upvalues: (copy) v_u_3, (copy) v_u_2
    local v562 = p561.Character.HumanoidRootPart
    for v_u_563 = 1, 3 do
        local v_u_564 = v_u_3.ringPart:Clone()
        if v_u_563 == 1 then
            v_u_564.CFrame = v562.CFrame * CFrame.new(0, 3, -2) * CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966)
        else
            v_u_564.CFrame = v562.CFrame * CFrame.new(0, 3, -1 * (v_u_563 * 10)) * CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966)
        end
        v_u_564.Parent = workspace.GarbageCollection
        task.spawn(function()
            -- upvalues: (ref) v_u_2, (copy) v_u_564, (copy) v_u_563
            local v565 = v_u_2:Create(v_u_564, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                ["Size"] = v_u_564.Size * (v_u_563 + v_u_563 * 30)
            })
            v565:Play()
            v565:Destroy()
            task.wait(0.1)
            task.delay(0.06, function()
                -- upvalues: (ref) v_u_564
                v_u_564.Whirl.Enabled = false
                v_u_564.Whirl2.Enabled = false
            end)
            local v566 = v_u_2:Create(v_u_564, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                ["Transparency"] = 1
            })
            v566:Play()
            v566:Destroy()
        end)
        game.Debris:AddItem(v_u_564, 1)
        task.wait()
    end
end
local function v_u_622(p568, p_u_569, p_u_570)
    -- upvalues: (copy) v_u_2
    local v571 = p568.Character.HumanoidRootPart
    local v_u_572 = math.random(5, 20)
    local v_u_573 = math.random(30, 30)
    local v_u_574 = math.random(5, 20)
    local v_u_575 = math.random(40, 40)
    local v_u_592, v_u_593, v_u_594, v_u_595 = (function()
        -- upvalues: (copy) p_u_570, (copy) v_u_573, (copy) v_u_572, (copy) v_u_575, (copy) v_u_574, (copy) p_u_569
        local v576 = p_u_570
        local v577 = math.random(-1, 1)
        local v578 = math.random
        local v579 = v576 + Vector3.new(v577, 0, v578(-1, 1))
        local v580 = v579.X
        local v581 = workspace:Raycast(v579 + Vector3.new(0, 200, 0), Vector3.new(0, -500, 0))
        local v582
        if v581 then
            v582 = v581.Position.Y
        else
            v582 = nil
        end
        local v583 = v579.Z
        local v584 = Vector3.new(v580, v582, v583)
        local v585 = v584.X + math.random(-v_u_573, v_u_573)
        local v586 = v584.Y + v_u_572
        local v587 = v584.Z + math.random(-v_u_573, v_u_573)
        local v588 = Vector3.new(v585, v586, v587)
        local v589 = v588.X + math.random(-v_u_575, v_u_575)
        local v590 = v588.Y + math.random(-v_u_574, v_u_574)
        local v591 = v588.Z + math.random(-v_u_575, v_u_575)
        return v584, v588, Vector3.new(v589, v590, v591), p_u_569
    end)()
    local v596 = Instance.new("Folder")
    v596.Parent = workspace.GarbageCollection
    local v_u_597 = script.eightlayer:Clone()
    v_u_597.Position = v_u_592
    v_u_597.Parent = v596
    v_u_597.CFrame = v571.CFrame * CFrame.new(0, 0, -5)
    v_u_597.Parent = workspace.GarbageCollection
    local v598 = Instance.new("AngularVelocity")
    v598.MaxTorque = (1 / 0)
    v598.AngularVelocity = Vector3.new(0, 0, 10)
    v598.Attachment0 = v_u_597.Attachment
    v598.Parent = v_u_597
    task.spawn(function()
        -- upvalues: (copy) v_u_597, (ref) v_u_2
        for _, v_u_599 in pairs(v_u_597:GetChildren()) do
            if v_u_599:IsA("Attachment") then
                v_u_2:Create(v_u_599, TweenInfo.new(2, Enum.EasingStyle.Linear), {
                    ["Position"] = v_u_599.Position + Vector3.new(0, 10, 0)
                }):Play()
                task.delay(0.5, function()
                    -- upvalues: (ref) v_u_2, (copy) v_u_599
                    v_u_2:Create(v_u_599, TweenInfo.new(2, Enum.EasingStyle.Linear), {
                        ["Position"] = Vector3.new(0, 0, 0)
                    }):Play()
                end)
            end
        end
        for _, v_u_600 in pairs(v_u_597:GetDescendants()) do
            if v_u_600:IsA("ParticleEmitter") then
                v_u_600:Emit(math.random(5, 7))
                if v_u_600.Name == "TrailBurst" then
                    v_u_600.Enabled = true
                    task.delay(3, function()
                        -- upvalues: (copy) v_u_600
                        v_u_600.Enabled = false
                    end)
                elseif v_u_600.Name == "AmbienceSmoke" or (v_u_600.Name == "RealisticBurst" or v_u_600.Name == "whiteBurst") then
                    local v601 = v_u_600.Size
                    v_u_600.Size = NumberSequence.new(v601.Keypoints[1].Time * 1.2, v601.Keypoints[1].Value * 3)
                    v_u_600.Enabled = true
                    task.delay(3, function()
                        -- upvalues: (copy) v_u_600
                        v_u_600.Enabled = false
                    end)
                    task.wait()
                else
                    local v602 = v_u_600.Size
                    v_u_600.Size = NumberSequence.new(v602.Keypoints[1].Time * 1.2, v602.Keypoints[1].Value * math.random(-1, 3))
                end
                task.delay(3, function()
                    -- upvalues: (copy) v_u_600
                    v_u_600.Enabled = false
                end)
            elseif v_u_600:IsA("Sound") then
                task.delay(0, function()
                    -- upvalues: (copy) v_u_600
                    v_u_600:Play()
                    task.wait()
                end)
            end
        end
        task.spawn(function()
            -- upvalues: (ref) v_u_2, (ref) v_u_597
            local v603 = v_u_2:Create(v_u_597, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                ["Size"] = v_u_597.Size * 2
            })
            v603:Play()
            v603:Destroy()
            task.wait(0.3)
            local v604 = v_u_2:Create(v_u_597, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                ["Transparency"] = 1
            })
            v604:Play()
            v604:Destroy()
        end)
    end)
    local v_u_605 = Instance.new("NumberValue")
    v_u_605.Value = 0
    v_u_605.Parent = v596
    local v620 = v_u_605.Changed:Connect(function()
        -- upvalues: (copy) v_u_597, (copy) v_u_605, (copy) v_u_592, (copy) v_u_593, (copy) v_u_594, (copy) v_u_595
        local v606 = v_u_597
        local v607 = CFrame.new
        local v608 = v_u_605.Value
        local v609 = v_u_592
        local v610 = v_u_593
        local v611 = v_u_594
        local v612 = v_u_595
        v606.CFrame = v607((1 - v608) ^ 3 * v609 + 3 * (1 - v608) ^ 2 * v608 * v610 + 3 * (1 - v608) * v608 ^ 2 * v611 + v608 ^ 3 * v612)
        local v613 = v_u_597.Position
        local v614 = v_u_605.Value + 0.1
        local v615 = v_u_592
        local v616 = v_u_593
        local v617 = v_u_594
        local v618 = v_u_595
        local v619 = (1 - v614) ^ 3 * v615 + 3 * (1 - v614) ^ 2 * v614 * v616 + 3 * (1 - v614) * v614 ^ 2 * v617 + v614 ^ 3 * v618
        v_u_597.CFrame = CFrame.lookAt(v613, v619)
    end)
    v_u_2:Create(v_u_605, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
        ["Value"] = 1
    }):Play()
    task.wait(1)
    if v620 then
        local v621 = v_u_2:Create(v_u_597, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
            ["Transparency"] = 1
        })
        v621:Play()
        v621:Destroy()
        v620:Disconnect()
    end
    game.Debris:AddItem(v596, 5)
    v_u_2:Create(v_u_597, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        ["Transparency"] = 1
    }):Play()
end
local function v_u_670(p623, p_u_624, p_u_625)
    -- upvalues: (copy) v_u_2
    local _ = p623.Character.HumanoidRootPart
    local v_u_626 = math.random(10, 30)
    local v_u_627 = math.random(10, 40)
    local v_u_644, v_u_645, v_u_646, v_u_647 = (function()
        -- upvalues: (copy) p_u_625, (copy) v_u_626, (copy) v_u_627, (copy) p_u_624
        local v628 = p_u_625
        local v629 = math.random(-1, 1)
        local v630 = math.random
        local v631 = v628 + Vector3.new(v629, 0, v630(-1, 1))
        local v632 = v631.X
        local v633 = workspace:Raycast(v631 + Vector3.new(0, 200, 0), Vector3.new(0, -500, 0))
        local v634
        if v633 then
            v634 = v633.Position.Y
        else
            v634 = nil
        end
        local v635 = v631.Z
        local v636 = Vector3.new(v632, v634, v635)
        local v637 = v636.X + math.random(-v_u_626, v_u_626)
        local v638 = v636.Y + 20
        local v639 = v636.Z + math.random(-v_u_626, v_u_626)
        local v640 = Vector3.new(v637, v638, v639)
        local v641 = v640.X + math.random(-v_u_627, v_u_627)
        local v642 = v640.Y + math.random(-20, 20)
        local v643 = v640.Z + math.random(-v_u_627, v_u_627)
        return v636, v640, Vector3.new(v641, v642, v643), p_u_624
    end)()
    local v648 = Instance.new("Folder")
    v648.Parent = workspace.GarbageCollection
    local v_u_649 = script.AkazaBall:Clone()
    v_u_649.Position = v_u_644
    v_u_649.Parent = v648
    task.delay(0, function()
        -- upvalues: (copy) v_u_649
        for _, v_u_650 in pairs(v_u_649.Check:GetChildren()) do
            local v651 = v_u_650.Size
            v_u_650.Size = NumberSequence.new(v651.Keypoints[1].Time * math.random(5, 12) / 10, v651.Keypoints[1].Value * math.random(1, 3))
            v_u_650.Enabled = true
            task.delay(0.5, function()
                -- upvalues: (copy) v_u_650
                v_u_650.Enabled = false
            end)
        end
    end)
    v_u_649.startup:Play()
    local v_u_652 = Instance.new("NumberValue")
    v_u_652.Value = 0
    v_u_652.Parent = v648
    local v667 = v_u_652.Changed:Connect(function()
        -- upvalues: (copy) v_u_649, (copy) v_u_652, (copy) v_u_644, (copy) v_u_645, (copy) v_u_646, (copy) v_u_647
        local v653 = v_u_649
        local v654 = CFrame.new
        local v655 = v_u_652.Value
        local v656 = v_u_644
        local v657 = v_u_645
        local v658 = v_u_646
        local v659 = v_u_647
        v653.CFrame = v654((1 - v655) ^ 3 * v656 + 3 * (1 - v655) ^ 2 * v655 * v657 + 3 * (1 - v655) * v655 ^ 2 * v658 + v655 ^ 3 * v659)
        local v660 = v_u_649.Position
        local v661 = v_u_652.Value + 0.1
        local v662 = v_u_644
        local v663 = v_u_645
        local v664 = v_u_646
        local v665 = v_u_647
        local v666 = (1 - v661) ^ 3 * v662 + 3 * (1 - v661) ^ 2 * v661 * v663 + 3 * (1 - v661) * v661 ^ 2 * v664 + v661 ^ 3 * v665
        v_u_649.CFrame = CFrame.lookAt(v660, v666)
    end)
    v_u_2:Create(v_u_652, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
        ["Value"] = 1
    }):Play()
    task.wait(0.8)
    if v667 then
        v_u_2:Create(v_u_649, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            ["Size"] = v_u_649.Size * 4
        }):Play()
        for _, v_u_668 in pairs(v_u_649:GetChildren()) do
            if v_u_668:IsA("ParticleEmitter") then
                local v669 = v_u_668.Size
                v_u_668.Size = NumberSequence.new(v669.Keypoints[1].Time * 0.5, v669.Keypoints[1].Value * 4)
                v_u_668.Enabled = true
                task.delay(0.2, function()
                    -- upvalues: (copy) v_u_668
                    v_u_668.Enabled = false
                end)
            end
        end
        v667:Disconnect()
    end
    game.Debris:AddItem(v648, 5)
    v_u_2:Create(v_u_649, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        ["Transparency"] = 1
    }):Play()
end
local function v_u_692(p671)
    -- upvalues: (copy) v_u_2
    local v672 = p671.Character.HumanoidRootPart
    local v_u_673 = script.explosivefurry:clone()
    local v674 = v672.CFrame * CFrame.new(math.random(-4, 4), math.random(-1, 3), math.random(-9, -5))
    local v675 = CFrame.Angles
    local v676 = math.random(-60, 60)
    local v677 = math.rad(v676)
    local v678 = math.random(-40, 40)
    v_u_673.CFrame = v674 * v675(v677, 0, (math.rad(v678)))
    v_u_673.Parent = workspace.GarbageCollection
    game.Debris:AddItem(v_u_673, 1.5)
    for _, v_u_679 in pairs(v_u_673:GetChildren()) do
        if v_u_679:IsA("Attachment") then
            v_u_2:Create(v_u_679, TweenInfo.new(2, Enum.EasingStyle.Linear), {
                ["Position"] = v_u_679.Position + Vector3.new(10, 0, 0)
            }):Play()
            task.delay(0.15, function()
                -- upvalues: (ref) v_u_2, (copy) v_u_679
                v_u_2:Create(v_u_679, TweenInfo.new(2, Enum.EasingStyle.Linear), {
                    ["Position"] = Vector3.new(0, 0, 0)
                }):Play()
            end)
        end
    end
    task.spawn(function()
        -- upvalues: (ref) v_u_2, (copy) v_u_673
        local v680 = v_u_2
        local v681 = v_u_673
        local v682 = TweenInfo.new(0.5, Enum.EasingStyle.Quad)
        local v683 = {
            ["Size"] = v_u_673.Size * math.random(6, 13) / 10
        }
        local v684 = v_u_673.CFrame
        local v685 = CFrame.Angles
        local v686 = math.random(-3600, 3600)
        v683.CFrame = v684 * v685(0, 0, (math.rad(v686)))
        local v687 = v680:Create(v681, v682, v683)
        v687:Play()
        v687:Destroy()
        task.wait(0.3)
        local v688 = v_u_2:Create(v_u_673, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
            ["Transparency"] = 1
        })
        v688:Play()
        v688:Destroy()
    end)
    for _, v_u_689 in pairs(v_u_673:GetDescendants()) do
        if v_u_689:IsA("ParticleEmitter") then
            v_u_689:Emit(math.random(1))
            if v_u_689.Name == "TrailBurst" then
                v_u_689.Enabled = true
                task.delay(0.4, function()
                    -- upvalues: (copy) v_u_689
                    v_u_689.Enabled = false
                end)
            elseif v_u_689.Name == "AmbienceSmoke" or (v_u_689.Name == "RealisticBurst" or v_u_689.Name == "whiteBurst") then
                local v690 = v_u_689.Size
                v_u_689.Size = NumberSequence.new(v690.Keypoints[1].Time * 0.5, v690.Keypoints[1].Value * math.random(5, 20) / 10)
                v_u_689.Enabled = true
                task.delay(0.2, function()
                    -- upvalues: (copy) v_u_689
                    v_u_689.Enabled = false
                end)
            else
                local v691 = v_u_689.Size
                v_u_689.Size = NumberSequence.new(v691.Keypoints[1].Time * 0.5, v691.Keypoints[1].Value * math.random(5, 10) / 10)
            end
            task.delay(0.2, function()
                -- upvalues: (copy) v_u_689
                v_u_689.Enabled = false
            end)
        elseif v_u_689:IsA("Sound") then
            task.delay(0, function()
                -- upvalues: (copy) v_u_689
                v_u_689:Play()
                task.wait()
            end)
        end
    end
end
local function v_u_707(p_u_693, p694)
    -- upvalues: (copy) v_u_233, (copy) v_u_2
    local v_u_695 = p_u_693.Character.HumanoidRootPart
    if p694 == true then
        local v_u_696 = script.punShock:Clone()
        v_u_696.Name = "punShock" .. p_u_693.Name
        v_u_696.Parent = workspace.GarbageCollection
        v_u_696:SetPrimaryPartCFrame(v_u_695.CFrame * CFrame.new(0, 0, -5))
        v_u_233(v_u_696.Wave, v_u_695)
        for _, v_u_697 in pairs(v_u_696.Circle:GetChildren()) do
            if v_u_697:IsA("Attachment") then
                v_u_2:Create(v_u_697, TweenInfo.new(2, Enum.EasingStyle.Linear), {
                    ["Position"] = v_u_697.Position + Vector3.new(10, 0, 0)
                }):Play()
                task.delay(0.15, function()
                    -- upvalues: (ref) v_u_2, (copy) v_u_697
                    v_u_2:Create(v_u_697, TweenInfo.new(2, Enum.EasingStyle.Linear), {
                        ["Position"] = Vector3.new(0, 0, 0)
                    }):Play()
                end)
            end
        end
        for _, v_u_698 in pairs(v_u_696:GetDescendants()) do
            if v_u_698:IsA("ParticleEmitter") then
                v_u_698:Emit(math.random(4))
                if v_u_698.Name == "TrailBurst" then
                    v_u_698.Enabled = true
                    task.delay(3, function()
                        -- upvalues: (copy) v_u_698
                        v_u_698.Enabled = false
                    end)
                elseif v_u_698.Name == "AmbienceSmoke" or (v_u_698.Name == "RealisticBurst" or v_u_698.Name == "whiteBurst") then
                    local v699 = v_u_698.Size
                    v_u_698.Size = NumberSequence.new(v699.Keypoints[1].Time * 1.1, v699.Keypoints[1].Value * 15)
                    v_u_698.Enabled = true
                    task.delay(4, function()
                        -- upvalues: (copy) v_u_698
                        v_u_698.Enabled = false
                    end)
                else
                    local v700 = v_u_698.Size
                    v_u_698.Size = NumberSequence.new(v700.Keypoints[1].Time * 0.8, v700.Keypoints[1].Value * 8)
                end
                task.delay(3, function()
                    -- upvalues: (copy) v_u_698
                    v_u_698.Enabled = false
                end)
            elseif v_u_698:IsA("Sound") then
                task.delay(0, function()
                    -- upvalues: (copy) v_u_698
                    v_u_698:Play()
                    task.wait()
                end)
            elseif v_u_698:IsA("MeshPart") or v_u_698:IsA("Part") then
                task.spawn(function()
                    -- upvalues: (copy) v_u_698, (ref) v_u_2, (copy) v_u_695, (copy) v_u_696
                    if v_u_698.Name == "Shockwave" then
                        local v701 = v_u_2:Create(v_u_698, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                            ["Size"] = v_u_698.Size * 3
                        })
                        v701:Play()
                        v701:Destroy()
                    else
                        local v702 = v_u_2:Create(v_u_698, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                            ["Size"] = v_u_698.Size * 4
                        })
                        v702:Play()
                        v702:Destroy()
                    end
                    task.spawn(function()
                        -- upvalues: (ref) v_u_695, (ref) v_u_2, (ref) v_u_698, (ref) v_u_696
                        repeat
                            task.wait(0.1)
                        until not v_u_695:FindFirstChild("superCharge")
                        local v703 = v_u_2:Create(v_u_698, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
                            ["Transparency"] = 1
                        })
                        v703:Play()
                        v703:Destroy()
                        game.Debris:AddItem(v_u_696, 0.1)
                    end)
                end)
            end
        end
    elseif p694 == false then
        task.spawn(function()
            -- upvalues: (copy) p_u_693, (ref) v_u_2
            local v704 = workspace.GarbageCollection:FindFirstChild("punShock" .. p_u_693.Name)
            for _, v705 in pairs(v704:GetDescendants()) do
                if v705:IsA("MeshPart") or v705:IsA("Part") then
                    local v706 = v_u_2:Create(v705, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
                        ["Transparency"] = 1
                    })
                    v706:Play()
                    v706:Destroy()
                    game.Debris:AddItem(v704, 0.1)
                    task.wait()
                end
            end
        end)
    end
end
local function v_u_737(p708)
    -- upvalues: (copy) v_u_2
    local v709 = p708.Character.HumanoidRootPart
    local v710 = script.Uptilt:Clone()
    v710:SetPrimaryPartCFrame(v709.CFrame * CFrame.new(0, -1, 0))
    v710.Parent = workspace.GarbageCollection
    local v711 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    for _, v_u_712 in pairs(v710:GetChildren()) do
        local v713 = v_u_2
        local v714 = {}
        local v715 = v_u_712.CFrame
        local v716 = CFrame.Angles
        local v717 = math.random(-360, 360)
        v714.CFrame = v715 * v716(0, math.rad(v717), 0)
        v714.Size = v_u_712.Size * 1.2
        local v718 = v713:Create(v_u_712, v711, v714)
        v718:Play()
        v718:Destroy()
        task.spawn(function()
            -- upvalues: (copy) v_u_712, (ref) v_u_2
            task.wait(0.5)
            if v_u_712.Name == "real" then
                local v719 = v_u_2
                local v720 = v_u_712
                local v721 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                local v722 = {}
                local v723 = v_u_712.CFrame
                local v724 = CFrame.Angles
                local v725 = math.random(-360, 360)
                v722.CFrame = v723 * v724(0, math.rad(v725), 0)
                local v726 = v_u_712.Size.X
                local v727 = v_u_712.Size.Z
                v722.Size = Vector3.new(v726, 0.45, v727)
                v722.Transparency = 1
                local v728 = v719:Create(v720, v721, v722)
                v728:Play()
                v728:Destroy()
            else
                local v729 = v_u_2
                local v730 = v_u_712
                local v731 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                local v732 = {}
                local v733 = v_u_712.CFrame
                local v734 = CFrame.Angles
                local v735 = math.random(-360, 360)
                v732.CFrame = v733 * v734(0, math.rad(v735), 0)
                v732.Size = Vector3.new(1, 0.45, 1)
                v732.Transparency = 1
                local v736 = v729:Create(v730, v731, v732)
                v736:Play()
                v736:Destroy()
            end
        end)
    end
    task.wait(1)
    v710:Destroy()
end
local function v_u_772(p738)
    -- upvalues: (copy) v_u_2
    local v739 = p738.Character.HumanoidRootPart
    local v_u_740 = script.projectImpact:Clone()
    v_u_740.Parent = workspace.GarbageCollection
    v_u_740:SetPrimaryPartCFrame(v739.CFrame * CFrame.new(0, -3, 0))
    local v741 = script.groundSmoke:Clone()
    v741.CFrame = v739.CFrame * CFrame.new(0, -1, 0)
    v741.Parent = workspace.GarbageCollection
    for _, v742 in pairs(v741.Attachment:GetChildren()) do
        v742:Emit(50)
    end
    task.spawn(function()
        -- upvalues: (copy) v_u_740
        for _, v743 in pairs(script.groundSFX:GetChildren()) do
            local v744 = v743:Clone()
            v744.Parent = v_u_740
            v744.Volume = math.random(1, 7) / 10
            v744:Play()
            game.Debris:AddItem(v744, 5)
        end
        for _, v745 in pairs(v_u_740["Meshes/forsds_Plane.055"]:GetChildren()) do
            v745:Emit(3)
        end
    end)
    local v746 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    for _, v747 in pairs(v_u_740:GetChildren()) do
        if v747.Name == "Ring" or v747.Name == "bottomRing" then
            local v748 = v_u_2
            local v749 = {}
            local v750 = v747.CFrame
            local v751 = CFrame.Angles
            local v752 = math.random(-3600, 3600)
            v749.CFrame = v750 * v751(0, math.rad(v752), 0)
            v749.Size = v747.Size * 2
            v749.Transparency = 0.5
            local v753 = v748:Create(v747, v746, v749)
            v753:Play()
            v753:Destroy()
            local v754 = v_u_2
            local v755 = {}
            local v756 = v747.CFrame
            local v757 = CFrame.Angles
            local v758 = math.random(-3600, 3600)
            v755.CFrame = v756 * v757(0, math.rad(v758), 0)
            v755.Transparency = 1
            local v759 = v754:Create(v747, v746, v755)
            v759:Play()
            v759:Destroy()
        elseif v747:IsA("MeshPart") or v747:IsA("Part") then
            local v760 = v_u_2
            local v761 = {}
            local v762 = v747.CFrame
            local v763 = CFrame.Angles
            local v764 = math.random(-3600, 3600)
            v761.CFrame = v762 * v763(0, math.rad(v764), 0)
            v761.Size = v747.Size * 1.5
            v761.Transparency = 0.5
            local v765 = v760:Create(v747, v746, v761)
            v765:Play()
            v765:Destroy()
            local v766 = v_u_2
            local v767 = {}
            local v768 = v747.CFrame
            local v769 = CFrame.Angles
            local v770 = math.random(-3600, 3600)
            v767.CFrame = v768 * v769(0, math.rad(v770), 0)
            v767.Transparency = 1
            local v771 = v766:Create(v747, v746, v767)
            v771:Play()
            v771:Destroy()
        end
    end
    task.wait(1)
    v_u_740:Destroy()
end
local function v_u_784(p773)
    -- upvalues: (copy) v_u_3, (copy) v_u_2
    local v774 = p773.Character
    local v775 = v774.HumanoidRootPart
    for _ = 1, 20 do
        if v774:FindFirstChild("Stunned") then
            break
        end
        local v_u_776 = script.moonMeshSlash:Clone()
        v_u_776.Second.Color = Color3.new(0.819608, 0.278431, 1)
        local v777 = math.random(-1000, 1000)
        local v778 = v_u_3.Sounds.Smack:Clone()
        v778.Parent = v_u_776
        v778.PlaybackSpeed = math.random(9, 13) / 10
        v778:Play()
        v_u_776:SetPrimaryPartCFrame(v775.CFrame * CFrame.new(math.random(-15, 15), math.random(3, 12), math.random(-25, -10)) * CFrame.Angles(math.rad(v777), math.rad(v777), (math.rad(v777))))
        v_u_776.Parent = workspace.GarbageCollection
        task.spawn(function()
            -- upvalues: (copy) v_u_776, (ref) v_u_2
            task.wait()
            for _, v_u_779 in pairs(v_u_776:GetDescendants()) do
                if v_u_779:IsA("ParticleEmitter") then
                    v_u_779:Emit(math.random(1, 2))
                end
                if v_u_779:IsA("MeshPart") then
                    task.spawn(function()
                        -- upvalues: (ref) v_u_2, (ref) v_u_776, (copy) v_u_779
                        local v780 = math.random(-1000, 1000)
                        local v781 = v_u_2:Create(v_u_776.PrimaryPart, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 1), {
                            ["CFrame"] = v_u_776.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(v780), 0)
                        })
                        v781:Play()
                        v781:Destroy()
                        task.wait(0.1)
                        local v782 = v_u_2:Create(v_u_779, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
                            ["Transparency"] = 1
                        })
                        v782:Play()
                        v782:Destroy()
                    end)
                end
            end
            task.wait(0.1)
            game.Debris:AddItem(v_u_776, 3)
            local v783 = v_u_2:Create(v_u_776.Main.light, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
                ["Brightness"] = 0
            })
            v783:Play()
            v783:Destroy()
        end)
        task.wait(0.08)
    end
end
local function v_u_798(p785, p786, p787, p788, p789, p790)
    local _ = p785.Character.HumanoidRootPart
    local _ = workspace.Live
    local _ = workspace.GarbageCollection
    for _ = 1, 2 do
        local v791 = script.Debris:Clone()
        v791.CanCollide = p790
        local _ = math.random(10, 30) / 10
        v791.Color = p787
        v791.Material = p788
        v791.Size = p789 / 3
        v791.CFrame = CFrame.new(p786) * CFrame.new(math.random(-12, 12), 10, 0)
        local v792 = math.random(-15, 15)
        local v793 = math.random(30, 120)
        local v794 = math.random
        v791.Velocity = Vector3.new(v792, v793, v794(-15, 15))
        local v795 = math.random(-15, 15)
        local v796 = math.random(-15, 15)
        local v797 = math.random
        v791.RotVelocity = Vector3.new(v795, v796, v797(-15, 15))
        game.Debris:AddItem(v791, 6)
        v791.Name = "Debris"
        v791.Parent = game.Workspace.GarbageCollection
    end
end
local function v_u_815(p799)
    -- upvalues: (copy) v_u_2
    local v_u_800 = p799.HumanoidRootPart
    for v_u_801 = 1, 20 do
        task.spawn(function()
            -- upvalues: (copy) v_u_800, (copy) v_u_801, (ref) v_u_2
            for _ = 1, math.random(1, 2) do
                local v802 = math.random(-1000, 1000)
                local v_u_803 = script.moonBlue:clone()
                v_u_803.Parent = workspace.GarbageCollection
                v_u_803:SetPrimaryPartCFrame(v_u_800.CFrame * CFrame.new(math.random(-10, 10), math.random(-2, 5), -v_u_801 * 5) * CFrame.Angles(math.rad(v802), math.rad(v802), (math.rad(v802))))
                if math.random(1, 2) == 2 then
                    v_u_803.Main.Color = Color3.new(1, 0.8, 0)
                    v_u_803.Second.Color = Color3.new(0.419608, 0.00784314, 1)
                end
                task.spawn(function()
                    -- upvalues: (copy) v_u_803, (ref) v_u_2
                    task.wait()
                    for _, v_u_804 in pairs(v_u_803:GetDescendants()) do
                        if v_u_804:IsA("ParticleEmitter") then
                            v_u_804:Emit(math.random(1, 2))
                        end
                        if v_u_804:IsA("MeshPart") or v_u_804:IsA("Part") then
                            task.spawn(function()
                                -- upvalues: (ref) v_u_2, (ref) v_u_803, (copy) v_u_804
                                local v_u_805 = math.random(-1234, 1234)
                                local v806 = v_u_2:Create(v_u_803.PrimaryPart, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                    ["CFrame"] = v_u_803.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(v_u_805), 0)
                                })
                                v806:Play()
                                v806:Destroy()
                                task.delay(0.1, function()
                                    -- upvalues: (ref) v_u_2, (ref) v_u_803, (copy) v_u_805
                                    local v807 = v_u_2
                                    local v808 = v_u_803.PrimaryPart
                                    local v809 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                                    local v810 = {}
                                    local v811 = v_u_805
                                    v810.CFrame = v_u_803.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(v811), 0)
                                    local v812 = v807:Create(v808, v809, v810)
                                    v812:Play()
                                    v812:Destroy()
                                end)
                                task.wait()
                                local v813 = v_u_2:Create(v_u_804, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
                                    ["Transparency"] = 1
                                })
                                v813:Play()
                                v813:Destroy()
                            end)
                        end
                    end
                    task.wait(0.1)
                    game.Debris:AddItem(v_u_803, 3)
                    local v814 = v_u_2:Create(v_u_803.Main.light, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
                        ["Brightness"] = 0
                    })
                    v814:Play()
                    v814:Destroy()
                end)
            end
        end)
        task.wait(0.04)
    end
end
local function v_u_829(p_u_816)
    -- upvalues: (copy) v_u_233, (copy) v_u_2
    local v817 = p_u_816.HumanoidRootPart
    local v818 = p_u_816["Left Arm"]:clone()
    v818.CFrame = p_u_816["Left Arm"].CFrame
    v818.CanCollide = true
    v818.Anchored = false
    v818.Material = Enum.Material.SmoothPlastic
    v818.Parent = workspace.GarbageCollection
    local v819 = math.random(-25, 25)
    local v820 = math.random(-25, 25)
    local v821 = math.random
    v818.RotVelocity = Vector3.new(v819, v820, v821(-25, 25))
    local v822 = math.random(-25, 25)
    local v823 = math.random(-5, 25)
    local v824 = math.random
    v818.Velocity = Vector3.new(v822, v823, v824(-25, 25))
    local v825 = script.splat:clone()
    v825.Parent = v817
    v825.PlaybackSpeed = math.random(5, 10) / 10
    v825:Play()
    for _ = 1, 6 do
        local v_u_826 = script.armChop:clone()
        v_u_826.Color = p_u_816["Left Arm"].Color
        p_u_816["Left Arm"].Transparency = 1
        local v827 = math.random(1, 2)
        v_u_826.Size = Vector3.new(v827, v827, v827)
        v_u_826.CFrame = p_u_816["Left Arm"].CFrame * CFrame.new(math.random(-0.5, 0.5), math.random(-1, 1), math.random(-0.83, 0.83)) * CFrame.Angles(math.random(-360, 360), math.random(-360, 360), math.random(-360, 360))
        v_u_826.Parent = workspace.GarbageCollection
        v_u_233(v_u_826, p_u_816["Left Arm"])
        task.delay(0.1, function()
            -- upvalues: (copy) p_u_816, (copy) v_u_826, (ref) v_u_2
            task.delay(0.12, function()
                -- upvalues: (ref) p_u_816
                p_u_816["Left Arm"].Transparency = 0
            end)
            v_u_826.blood:Emit(math.random(3, 8))
            v_u_826.smoke:Emit(math.random(3, 8))
            local v828 = v_u_2:Create(v_u_826, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 5), {
                ["Size"] = Vector3.new(0, 0, 0)
            })
            v828:Play()
            v828:Destroy()
        end)
        game.Debris:AddItem(v_u_826, 1.5)
        task.wait(0.085)
    end
    game.Debris:AddItem(v818, 2)
end
local function v_u_850(p830)
    -- upvalues: (copy) v_u_2, (copy) v_u_16
    local v_u_831 = p830.Character
    local v_u_832 = v_u_831.HumanoidRootPart
    local v833 = script.insectAir.wooshSFX:Clone()
    v833.Parent = v_u_832
    v833:Play()
    game.Debris:AddItem(v833, 1)
    task.spawn(function()
        -- upvalues: (copy) v_u_831, (copy) v_u_832, (ref) v_u_2
        if v_u_831:FindFirstChild("KatanaBlade") then
            v_u_831:FindFirstChild("KatanaBlade").Blade.normalTrail.Enabled = false
        elseif v_u_831:FindFirstChild("KokushiboKatanaBlade") then
            v_u_831:FindFirstChild("KokushiboKatanaBlade").Blade.normalTrail.Enabled = false
        end
        task.spawn(function()
            -- upvalues: (ref) v_u_832, (ref) v_u_831, (ref) v_u_2
            v_u_832.SoruEmit.Enabled = true
            if v_u_831.Head:FindFirstChild("face") then
                v_u_831.Head.face.Transparency = 1
            end
            for _, v_u_834 in pairs(v_u_831:GetDescendants()) do
                if v_u_834:IsA("BasePart") or (v_u_834:IsA("Part") or v_u_834:IsA("MeshPart")) then
                    local v835 = v_u_2:Create(v_u_834, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Transparency"] = 1
                    })
                    v835:Play()
                    v835:Destroy()
                elseif v_u_834:IsA("Accessory") then
                    local v836 = v_u_2:Create(v_u_834.Handle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Transparency"] = 1
                    })
                    v836:Play()
                    v836:Destroy()
                elseif v_u_834:IsA("Tool") then
                    v_u_834:Destroy()
                end
                if not v_u_831:FindFirstChild("IFrame") then
                    if v_u_834:IsA("Sound") then
                        v_u_834:Stop()
                    elseif v_u_834:IsA("ParticleEmitter") then
                        v_u_834.Enabled = false
                        task.delay(1, function()
                            -- upvalues: (copy) v_u_834
                            if v_u_834.Name == "Insects" or v_u_834.Name == "Insects2" then
                                v_u_834.Enabled = true
                            end
                        end)
                    elseif v_u_834:IsA("Trail") then
                        v_u_834.Enabled = false
                        if v_u_834.Name == "normalTrail" then
                            task.delay(1, function()
                                -- upvalues: (copy) v_u_834
                                v_u_834.Enabled = true
                            end)
                        end
                    elseif v_u_834:IsA("Beam") then
                        v_u_834.Enabled = false
                    elseif v_u_834.Name == "Blade" and v_u_834.Parent:FindFirstChild("normalTrail") then
                        v_u_834.Parent.normalTrail.Enabled = false
                        task.delay(1, function()
                            -- upvalues: (copy) v_u_834
                            v_u_834.Parent.normalTrail.Enabled = true
                        end)
                    end
                end
            end
            task.spawn(function()
                -- upvalues: (ref) v_u_832
                task.wait(0.3)
                v_u_832.SoruEmit.Enabled = false
            end)
            task.wait(1)
            for _, v837 in pairs(v_u_831:GetDescendants()) do
                if v837.Name ~= "HumanoidRootPart" then
                    if v837:IsA("BasePart") or (v837:IsA("Part") or v837:IsA("MeshPart")) then
                        if v837.Parent:FindFirstChild("bladeAttach") then
                            local v838 = v_u_2:Create(v837.Parent.Base, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                ["Transparency"] = 0
                            })
                            v838:Play()
                            v838:Destroy()
                            v837.Parent.Blade.Transparency = 1
                            v837.Parent.Handle.Transparency = 1
                        else
                            local v839 = v_u_2:Create(v837, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                ["Transparency"] = 0
                            })
                            v839:Play()
                            v839:Destroy()
                        end
                    elseif v837:IsA("Accessory") then
                        local v840 = v_u_2:Create(v837.Handle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                            ["Transparency"] = 0
                        })
                        v840:Play()
                        v840:Destroy()
                    end
                end
            end
            if v_u_831.Head:FindFirstChild("face") then
                v_u_831.Head.face.Transparency = 0
            end
        end)
    end)
    task.wait(0.1)
    local v841 = script.insectAir:Clone()
    v841:SetPrimaryPartCFrame(v_u_831.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5) * CFrame.Angles(0.8726646259971648, 0, 0))
    v841.Parent = workspace.GarbageCollection
    game.Debris:AddItem(v841, 1.5)
    task.delay(0.1, function()
        -- upvalues: (copy) v_u_832, (ref) v_u_16
        local v_u_842 = script.groundSmoke:Clone()
        v_u_842.CFrame = v_u_832.CFrame * CFrame.new(0, -1, 0)
        v_u_842.Parent = workspace.GarbageCollection
        for _, v843 in pairs(v_u_842.Attachment:GetChildren()) do
            v843:Emit(1)
        end
        task.spawn(function()
            -- upvalues: (copy) v_u_842
            for _, v844 in pairs(script.groundSFX:GetChildren()) do
                local v845 = v844:Clone()
                v845.Parent = v_u_842
                v845.Volume = math.random(1, 7) / 10
                v845:Play()
                game.Debris:AddItem(v845, 3)
            end
        end)
        v_u_16({
            ["Origin"] = v_u_832.CFrame * CFrame.new(0, 1, 0),
            ["Radius"] = 10,
            ["Amount"] = 10,
            ["Size"] = Vector3.new(2, 3, 2)
        })
    end)
    for _, v_u_846 in pairs(v841:GetDescendants()) do
        if v_u_846:IsA("ParticleEmitter") then
            v_u_846:Emit(math.random(3, 8))
            task.delay(1, function()
                -- upvalues: (copy) v_u_846
                v_u_846.Enabled = false
            end)
        elseif v_u_846:IsA("Sound") then
            task.delay(0, function()
                -- upvalues: (copy) v_u_846
                v_u_846:Play()
                task.wait()
            end)
        elseif v_u_846:IsA("Beam") then
            task.spawn(function()
                -- upvalues: (copy) v_u_846
                for v847 = 0.5, 1, 0.01 do
                    v_u_846.Transparency = NumberSequence.new(v847, 1)
                    task.wait()
                end
            end)
        elseif v_u_846:IsA("MeshPart") or v_u_846:IsA("Part") then
            task.spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_846
                local v848 = v_u_2:Create(v_u_846, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                    ["Size"] = v_u_846.Size * 1.3
                })
                v848:Play()
                v848:Destroy()
                task.wait(0.4)
                local v849 = v_u_2:Create(v_u_846, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                    ["Transparency"] = 1
                })
                v849:Play()
                v849:Destroy()
            end)
        end
    end
end
local function v_u_871(p851)
    -- upvalues: (copy) v_u_16, (copy) v_u_196, (copy) v_u_2, (copy) v_u_233
    local v_u_852 = p851.Character
    local v_u_853 = v_u_852.HumanoidRootPart
    task.spawn(function()
        -- upvalues: (ref) v_u_16, (copy) v_u_853, (ref) v_u_196
        v_u_16({
            ["Origin"] = v_u_853.CFrame * CFrame.new(0, 1, 0),
            ["Radius"] = 10,
            ["Amount"] = 10,
            ["Size"] = Vector3.new(2, 3, 2)
        })
        for _ = 1, 35 do
            v_u_196({
                ["StartPos"] = v_u_853.CFrame * CFrame.new(0, 0, 0),
                ["Offset"] = 3,
                ["Amount"] = 1,
                ["Size"] = Vector3.new(1, 1, 1),
                ["Filter"] = { workspace.GarbageCollection },
                ["IterationDelay"] = 0,
                ["Duration"] = 2
            })
            task.wait()
        end
    end)
    local v854 = script.insectAir.wooshSFX:Clone()
    v854.Parent = v_u_853
    v854:Play()
    game.Debris:AddItem(v854, 1)
    task.spawn(function()
        -- upvalues: (copy) v_u_852, (copy) v_u_853, (ref) v_u_2
        if v_u_852:FindFirstChild("KatanaBlade") then
            v_u_852:FindFirstChild("KatanaBlade").Blade.normalTrail.Enabled = false
        elseif v_u_852:FindFirstChild("KokushiboKatanaBlade") then
            v_u_852:FindFirstChild("KokushiboKatanaBlade").Blade.normalTrail.Enabled = false
        end
        task.spawn(function()
            -- upvalues: (ref) v_u_853, (ref) v_u_852, (ref) v_u_2
            v_u_853.SoruEmit.Enabled = true
            if v_u_852.Head:FindFirstChild("face") then
                v_u_852.Head.face.Transparency = 1
            end
            for _, v_u_855 in pairs(v_u_852:GetDescendants()) do
                if v_u_855:IsA("BasePart") or (v_u_855:IsA("Part") or v_u_855:IsA("MeshPart")) then
                    local v856 = v_u_2:Create(v_u_855, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Transparency"] = 1
                    })
                    v856:Play()
                    v856:Destroy()
                elseif v_u_855:IsA("Accessory") then
                    local v857 = v_u_2:Create(v_u_855.Handle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Transparency"] = 1
                    })
                    v857:Play()
                    v857:Destroy()
                end
                if not v_u_852:FindFirstChild("IFrame") then
                    if v_u_855:IsA("Sound") then
                        v_u_855:Stop()
                    elseif v_u_855:IsA("ParticleEmitter") then
                        v_u_855.Enabled = false
                        task.delay(1, function()
                            -- upvalues: (copy) v_u_855
                            if v_u_855.Name == "Insects" or v_u_855.Name == "Insects2" then
                                v_u_855.Enabled = true
                            end
                        end)
                    elseif v_u_855:IsA("Trail") then
                        v_u_855.Enabled = false
                        if v_u_855.Name == "normalTrail" then
                            task.delay(1, function()
                                -- upvalues: (copy) v_u_855
                                v_u_855.Enabled = true
                            end)
                        end
                    elseif v_u_855:IsA("Beam") then
                        v_u_855.Enabled = false
                    elseif v_u_855.Name == "Blade" and v_u_855.Parent:FindFirstChild("normalTrail") then
                        v_u_855.Parent.normalTrail.Enabled = false
                        task.delay(1, function()
                            -- upvalues: (copy) v_u_855
                            v_u_855.Parent.normalTrail.Enabled = true
                        end)
                    end
                end
            end
            task.spawn(function()
                -- upvalues: (ref) v_u_853
                task.wait(0.3)
                v_u_853.SoruEmit.Enabled = false
            end)
            task.wait(1)
            for _, v858 in pairs(v_u_852:GetDescendants()) do
                if v858.Name ~= "HumanoidRootPart" then
                    if v858:IsA("BasePart") or (v858:IsA("Part") or v858:IsA("MeshPart")) then
                        if v858.Parent:FindFirstChild("bladeAttach") then
                            local v859 = v_u_2:Create(v858.Parent.Base, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                ["Transparency"] = 0
                            })
                            v859:Play()
                            v859:Destroy()
                            v858.Parent.Blade.Transparency = 1
                            v858.Parent.Handle.Transparency = 1
                        else
                            local v860 = v_u_2:Create(v858, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                ["Transparency"] = 0
                            })
                            v860:Play()
                            v860:Destroy()
                        end
                    elseif v858:IsA("Accessory") then
                        local v861 = v_u_2:Create(v858.Handle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                            ["Transparency"] = 0
                        })
                        v861:Play()
                        v861:Destroy()
                    end
                end
            end
            if v_u_852.Head:FindFirstChild("face") then
                v_u_852.Head.face.Transparency = 0
            end
        end)
    end)
    local v862 = script.insectThrust:Clone()
    v862:SetPrimaryPartCFrame(v_u_852.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5) * CFrame.Angles(1.5707963267948966, 0, 0))
    v862.Parent = workspace.GarbageCollection
    v_u_233(v862.particleShock, v_u_852.HumanoidRootPart)
    game.Debris:AddItem(v862, 1.5)
    task.delay(0.1, function()
        -- upvalues: (copy) v_u_853
        local v_u_863 = script.groundSmoke:Clone()
        v_u_863.CFrame = v_u_853.CFrame * CFrame.new(0, -1, 0)
        v_u_863.Parent = workspace.GarbageCollection
        for _, v864 in pairs(v_u_863.Attachment:GetChildren()) do
            v864:Emit(1)
        end
        task.spawn(function()
            -- upvalues: (copy) v_u_863
            for _, v865 in pairs(script.groundSFX:GetChildren()) do
                local v866 = v865:Clone()
                v866.Parent = v_u_863
                v866.Volume = math.random(1, 7) / 10
                v866:Play()
                game.Debris:AddItem(v866, 3)
            end
        end)
    end)
    for _, v_u_867 in pairs(v862:GetDescendants()) do
        if v_u_867:IsA("ParticleEmitter") then
            v_u_867:Emit(math.random(3, 8))
            task.delay(1, function()
                -- upvalues: (copy) v_u_867
                v_u_867.Enabled = false
            end)
        elseif v_u_867:IsA("Sound") then
            task.delay(0, function()
                -- upvalues: (copy) v_u_867
                v_u_867:Play()
                task.wait()
            end)
        elseif v_u_867:IsA("Beam") then
            task.spawn(function()
                -- upvalues: (copy) v_u_867
                for v868 = 0.5, 1, 0.01 do
                    v_u_867.Transparency = NumberSequence.new(v868, 1)
                    task.wait()
                end
            end)
        elseif v_u_867:IsA("MeshPart") or v_u_867:IsA("Part") then
            task.spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_867
                local v869 = v_u_2:Create(v_u_867, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                    ["Size"] = v_u_867.Size * 2.5
                })
                v869:Play()
                v869:Destroy()
                local v870 = v_u_2:Create(v_u_867, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                    ["Transparency"] = 1
                })
                v870:Play()
                v870:Destroy()
            end)
        end
    end
end
local function v_u_877(p872)
    local v873
    if p872:IsA("Model") then
        v873 = p872
    else
        v873 = p872.Character
    end
    local v874 = v873.HumanoidRootPart
    local v_u_875 = script.Gravestone:Clone()
    v_u_875:SetPrimaryPartCFrame(v874.CFrame * CFrame.new(0, -0.2, -2) * CFrame.Angles(0, 2.443460952792061, 0))
    task.spawn(function()
        -- upvalues: (copy) v_u_875
        for _, v876 in pairs(v_u_875.PrimaryPart.smoke:GetChildren()) do
            v876:Emit(5)
        end
    end)
    v_u_875.PrimaryPart.SurfaceGui.Rest.Text = "Rest In Peace,\n" .. p872.Name
    v_u_875.PrimaryPart.SurfaceGui.Rest.Visible = true
    v_u_875.Parent = workspace.GarbageCollection
    v_u_875.PrimaryPart.Lame:Play()
    game.Debris:AddItem(v_u_875, 12)
end
local function v_u_889(p878)
    -- upvalues: (copy) v_u_2
    if not p878:IsA("Model") then
        p878 = p878.Character
    end
    local v879 = p878.HumanoidRootPart
    for _ = 1, 15 do
        local v880 = v879.CFrame
        local v_u_881 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local v_u_882 = script.Coin:clone()
        v_u_882.Name = "debreee"
        v_u_882.money.PlaybackSpeed = math.random(9, 15) / 10
        v_u_882.money:Play()
        task.spawn(function()
            -- upvalues: (copy) v_u_882
            game.Debris:AddItem(v_u_882, 5)
        end)
        v_u_882.Anchored = false
        v_u_882.CanCollide = false
        v_u_882.CanTouch = false
        v_u_882.CFrame = CFrame.new(v880.Position) * CFrame.new(0, math.random(1, 5), 0)
        v_u_882.Size = Vector3.new(1, 1, 0.2) * math.random(-1, 3)
        local v883 = math.random(-10, 10)
        local v884 = math.random(-10, 10)
        local v885 = math.random
        v_u_882.RotVelocity = Vector3.new(v883, v884, v885(-10, 10))
        local v886 = math.random(-25, 25)
        local v887 = math.random(30, 55)
        local v888 = math.random
        v_u_882.Velocity = Vector3.new(v886, v887, v888(-25, 25))
        v_u_882.Parent = workspace.GarbageCollection
        task.delay(0.3, function()
            -- upvalues: (copy) v_u_882
            v_u_882.CanCollide = true
        end)
        task.delay(2, function()
            -- upvalues: (ref) v_u_2, (copy) v_u_882, (copy) v_u_881
            v_u_2:Create(v_u_882, v_u_881, {
                ["Size"] = Vector3.new(0, 0, 0)
            }):Play()
            game.Debris:AddItem(v_u_882, 0.6)
        end)
        task.wait()
    end
end
local function v_u_896(p_u_890)
    -- upvalues: (copy) v_u_2, (copy) v_u_233
    if not p_u_890:IsA("Model") then
        p_u_890 = p_u_890.Character
    end
    local v891 = p_u_890.HumanoidRootPart
    task.spawn(function()
        -- upvalues: (ref) p_u_890, (ref) v_u_2
        if p_u_890.Head:FindFirstChild("face") then
            p_u_890.Head.face.Transparency = 1
        end
        for _, v892 in pairs(p_u_890:GetDescendants()) do
            if v892:IsA("BasePart") or (v892:IsA("Part") or v892:IsA("MeshPart")) then
                local v893 = v_u_2:Create(v892, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                    ["Transparency"] = 1
                })
                v893:Play()
                v893:Destroy()
            elseif v892:IsA("Accessory") then
                local v894 = v_u_2:Create(v892.Handle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                    ["Transparency"] = 1
                })
                v894:Play()
                v894:Destroy()
            end
        end
    end)
    local v895 = script.Fish:clone()
    v895.Parent = workspace.GarbageCollection
    v895.CFrame = v891.CFrame
    v895.bubble:Play()
    v895.splash:Play()
    v_u_233(v895, v891)
    game.Debris:AddItem(v895, 5)
end
local function v_u_903(p897)
    -- upvalues: (copy) v_u_233, (copy) v_u_2
    if not (p897:IsA("Model") or p897:FindFirstChild("HumanoidRootPart")) then
        p897 = p897.Character
    end
    local _ = p897.HumanoidRootPart
    local v898 = script.insectBarrage:Clone()
    v898:SetPrimaryPartCFrame(p897.HumanoidRootPart.CFrame * CFrame.new(math.random(-1, 1), math.random(-1, 3), math.random(-5, -1)) * CFrame.Angles(1.5707963267948966, 0, 0))
    v898.Parent = workspace.GarbageCollection
    v_u_233(v898.particleShock, p897.HumanoidRootPart)
    game.Debris:AddItem(v898, 1.5)
    for _, v_u_899 in pairs(v898:GetDescendants()) do
        if v_u_899:IsA("ParticleEmitter") then
            v_u_899:Emit(math.random(3, 8))
            task.delay(1, function()
                -- upvalues: (copy) v_u_899
                v_u_899.Enabled = false
            end)
        elseif v_u_899:IsA("Sound") then
            task.delay(0, function()
                -- upvalues: (copy) v_u_899
                v_u_899:Play()
                task.wait()
            end)
        elseif v_u_899:IsA("Beam") then
            task.spawn(function()
                -- upvalues: (copy) v_u_899
                for v900 = 0.5, 1, 0.01 do
                    v_u_899.Transparency = NumberSequence.new(v900, 1)
                    task.wait()
                end
            end)
        elseif v_u_899:IsA("MeshPart") or v_u_899:IsA("Part") then
            task.spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_899
                local v901 = v_u_2:Create(v_u_899, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
                    ["Size"] = v_u_899.Size * 1.5
                })
                v901:Play()
                v901:Destroy()
                local v902 = v_u_2:Create(v_u_899, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
                    ["Transparency"] = 1
                })
                v902:Play()
                v902:Destroy()
            end)
        end
    end
end
local function v_u_932(p904)
    -- upvalues: (copy) v_u_2
    if not (p904:IsA("Model") or p904:FindFirstChild("HumanoidRootPart")) then
        p904 = p904.Character
    end
    local v905
    if p904:FindFirstChild("HumanoidRootPart") then
        v905 = p904.HumanoidRootPart
    else
        v905 = nil
    end
    local v906 = script.fireUptilt:Clone()
    v906:SetPrimaryPartCFrame(v905.CFrame * CFrame.new(0, -1, 0) * CFrame.Angles(0, 1.5707963267948966, 0))
    v906.Parent = workspace.GarbageCollection
    local v907 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    for _, v_u_908 in pairs(v906:GetChildren()) do
        if v_u_908.Name == "Main" or (v_u_908.Name == "Second" or v_u_908.Name == "realMain") then
            local v909 = v_u_2:Create(v_u_908, v907, {
                ["CFrame"] = v_u_908.CFrame * CFrame.Angles(0, 15.707963267948966, 0),
                ["Transparency"] = 1
            })
            v909:Play()
            v909:Destroy()
        else
            local v910 = v_u_2
            local v911 = {}
            local v912 = v_u_908.CFrame
            local v913 = CFrame.Angles
            local v914 = math.random(-1360, 1360)
            v911.CFrame = v912 * v913(0, math.rad(v914), 0)
            v911.Size = v_u_908.Size * 3
            local v915 = v910:Create(v_u_908, v907, v911)
            v915:Play()
            v915:Destroy()
            task.delay(0.1, function()
                -- upvalues: (copy) v_u_908, (ref) v_u_2
                if v_u_908.Name == "real" then
                    local v916 = v_u_2
                    local v917 = v_u_908
                    local v918 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                    local v919 = {}
                    local v920 = v_u_908.CFrame
                    local v921 = CFrame.Angles
                    local v922 = math.random(-1360, 1360)
                    v919.CFrame = v920 * v921(0, math.rad(v922), 0)
                    v919.Size = v_u_908.Size * 1.5
                    v919.Transparency = 1
                    local v923 = v916:Create(v917, v918, v919)
                    v923:Play()
                    v923:Destroy()
                else
                    local v924 = v_u_2
                    local v925 = v_u_908
                    local v926 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                    local v927 = {}
                    local v928 = v_u_908.CFrame
                    local v929 = CFrame.Angles
                    local v930 = math.random(-1360, 1360)
                    v927.CFrame = v928 * v929(0, math.rad(v930), 0)
                    v927.Size = v_u_908.Size * 1.5
                    v927.Transparency = 1
                    local v931 = v924:Create(v925, v926, v927)
                    v931:Play()
                    v931:Destroy()
                end
            end)
        end
    end
    task.wait(1)
    v906:Destroy()
end
local function v_u_934(_, p933)
    -- upvalues: (copy) v_u_196
    v_u_196({
        ["StartPos"] = p933.CFrame * CFrame.new(0, 0, 0),
        ["Offset"] = 9,
        ["Amount"] = 2,
        ["Size"] = Vector3.new(3, 3, 3),
        ["Filter"] = { workspace.GarbageCollection },
        ["IterationDelay"] = 0,
        ["Duration"] = 1
    })
end
local function v_u_980(p935)
    -- upvalues: (copy) v_u_16, (copy) v_u_196, (copy) v_u_2, (copy) v_u_233
    local v_u_936 = p935.Character
    local v_u_937 = v_u_936.HumanoidRootPart
    task.spawn(function()
        -- upvalues: (ref) v_u_16, (copy) v_u_937, (ref) v_u_196
        v_u_16({
            ["Origin"] = v_u_937.CFrame * CFrame.new(0, 1, 0),
            ["Radius"] = 10,
            ["Amount"] = 10,
            ["Size"] = Vector3.new(2, 3, 2)
        })
        for _ = 1, 35 do
            v_u_196({
                ["StartPos"] = v_u_937.CFrame * CFrame.new(0, 0, 0),
                ["Offset"] = 3,
                ["Amount"] = 1,
                ["Size"] = Vector3.new(1, 1, 1),
                ["Filter"] = { workspace.GarbageCollection },
                ["IterationDelay"] = 0,
                ["Duration"] = 2
            })
            task.wait()
        end
    end)
    task.wait(0.2)
    task.spawn(function()
        -- upvalues: (copy) v_u_936, (copy) v_u_937, (ref) v_u_2
        if v_u_936:FindFirstChild("KatanaBlade") then
            v_u_936:FindFirstChild("KatanaBlade").Blade.normalTrail.Enabled = false
        elseif v_u_936:FindFirstChild("KokushiboKatanaBlade") then
            v_u_936:FindFirstChild("KokushiboKatanaBlade").Blade.normalTrail.Enabled = false
        end
        task.spawn(function()
            -- upvalues: (ref) v_u_937, (ref) v_u_936, (ref) v_u_2
            v_u_937.Soru:Play()
            v_u_937.SoruEmit.Enabled = true
            if v_u_936.Head:FindFirstChild("face") then
                v_u_936.Head.face.Transparency = 1
            end
            for _, v_u_938 in pairs(v_u_936:GetDescendants()) do
                if v_u_938:IsA("BasePart") or (v_u_938:IsA("Part") or v_u_938:IsA("MeshPart")) then
                    local v939 = v_u_2:Create(v_u_938, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Transparency"] = 1
                    })
                    v939:Play()
                    v939:Destroy()
                elseif v_u_938:IsA("Accessory") then
                    local v940 = v_u_2:Create(v_u_938.Handle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Transparency"] = 1
                    })
                    v940:Play()
                    v940:Destroy()
                end
                if not v_u_936:FindFirstChild("IFrame") then
                    if not v_u_938:IsA("Sound") then
                        if v_u_938:IsA("ParticleEmitter") then
                            if v_u_938.Name ~= "SoruEmit" then
                                v_u_938.Enabled = false
                            end
                            task.delay(1, function()
                                -- upvalues: (copy) v_u_938
                                if v_u_938.Name == "Insects" or v_u_938.Name == "Insects2" then
                                    v_u_938.Enabled = true
                                end
                            end)
                        elseif v_u_938:IsA("Trail") then
                            v_u_938.Enabled = false
                            if v_u_938.Name == "normalTrail" then
                                task.delay(1, function()
                                    -- upvalues: (copy) v_u_938
                                    v_u_938.Enabled = true
                                end)
                            end
                        elseif v_u_938:IsA("Beam") then
                            v_u_938.Enabled = false
                        elseif v_u_938.Name == "Blade" and v_u_938.Parent:FindFirstChild("normalTrail") then
                            v_u_938.Parent.normalTrail.Enabled = false
                            task.delay(1, function()
                                -- upvalues: (copy) v_u_938
                                v_u_938.Parent.normalTrail.Enabled = true
                            end)
                        end
                    end
                end
            end
            task.spawn(function()
                -- upvalues: (ref) v_u_937
                task.wait(0.3)
                v_u_937.SoruEmit.Enabled = false
            end)
            task.wait(0.4)
            for _, v941 in pairs(v_u_936:GetDescendants()) do
                if v941.Name ~= "HumanoidRootPart" then
                    if v941:IsA("BasePart") or (v941:IsA("Part") or v941:IsA("MeshPart")) then
                        if v941.Parent:FindFirstChild("bladeAttach") then
                            local v942 = v_u_2:Create(v941.Parent.Base, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                ["Transparency"] = 0
                            })
                            v942:Play()
                            v942:Destroy()
                            v941.Parent.Blade.Transparency = 1
                            v941.Parent.Handle.Transparency = 1
                        else
                            local v943 = v_u_2:Create(v941, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                ["Transparency"] = 0
                            })
                            v943:Play()
                            v943:Destroy()
                        end
                    elseif v941:IsA("Accessory") then
                        local v944 = v_u_2:Create(v941.Handle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                            ["Transparency"] = 0
                        })
                        v944:Play()
                        v944:Destroy()
                    end
                end
            end
            if v_u_936.Head:FindFirstChild("face") then
                v_u_936.Head.face.Transparency = 0
            end
        end)
    end)
    task.wait(0.5)
    local v945 = script.insectThrust:Clone()
    v945:SetPrimaryPartCFrame(v_u_936.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5) * CFrame.Angles(1.5707963267948966, 0, 0))
    v945.Parent = workspace.GarbageCollection
    v_u_233(v945.particleShock, v_u_936.HumanoidRootPart)
    game.Debris:AddItem(v945, 0.5)
    task.spawn(function()
        -- upvalues: (copy) v_u_937, (ref) v_u_2
        local v946 = script.insectBee:Clone()
        v946:SetPrimaryPartCFrame(v_u_937.CFrame * CFrame.new(0, -1, 0) * CFrame.Angles(0, 1.5707963267948966, 0))
        v946.Parent = workspace.GarbageCollection
        local v947 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        for _, v_u_948 in pairs(v946:GetChildren()) do
            if v_u_948.Name == "Main" or (v_u_948.Name == "Second" or v_u_948.Name == "realMain") then
                local v949 = v_u_2:Create(v_u_948, v947, {
                    ["CFrame"] = v_u_948.CFrame * CFrame.Angles(15.707963267948966, 0, 0),
                    ["Transparency"] = 1
                })
                v949:Play()
                v949:Destroy()
            else
                local v950 = v_u_2
                local v951 = {}
                local v952 = v_u_948.CFrame
                local v953 = CFrame.Angles
                local v954 = math.random(-1360, 1360)
                v951.CFrame = v952 * v953(0, math.rad(v954), 0)
                v951.Size = v_u_948.Size * 3
                local v955 = v950:Create(v_u_948, v947, v951)
                v955:Play()
                v955:Destroy()
                task.delay(0.1, function()
                    -- upvalues: (copy) v_u_948, (ref) v_u_2
                    if v_u_948.Name == "real" then
                        local v956 = v_u_2
                        local v957 = v_u_948
                        local v958 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                        local v959 = {}
                        local v960 = v_u_948.CFrame
                        local v961 = CFrame.Angles
                        local v962 = math.random(-1360, 1360)
                        v959.CFrame = v960 * v961(0, math.rad(v962), 0)
                        v959.Size = v_u_948.Size * 1.5
                        v959.Transparency = 1
                        local v963 = v956:Create(v957, v958, v959)
                        v963:Play()
                        v963:Destroy()
                    else
                        local v964 = v_u_2
                        local v965 = v_u_948
                        local v966 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                        local v967 = {}
                        local v968 = v_u_948.CFrame
                        local v969 = CFrame.Angles
                        local v970 = math.random(-1360, 1360)
                        v967.CFrame = v968 * v969(0, math.rad(v970), 0)
                        v967.Size = v_u_948.Size * 1.5
                        v967.Transparency = 1
                        local v971 = v964:Create(v965, v966, v967)
                        v971:Play()
                        v971:Destroy()
                    end
                end)
            end
        end
        task.wait(1)
        v946:Destroy()
    end)
    task.delay(0.1, function()
        -- upvalues: (copy) v_u_937
        local v_u_972 = script.groundSmoke:Clone()
        v_u_972.CFrame = v_u_937.CFrame * CFrame.new(0, -1, 0)
        v_u_972.Parent = workspace.GarbageCollection
        for _, v973 in pairs(v_u_972.Attachment:GetChildren()) do
            v973:Emit(1)
        end
        task.spawn(function()
            -- upvalues: (copy) v_u_972
            for _, v974 in pairs(script.groundSFX:GetChildren()) do
                local v975 = v974:Clone()
                v975.Parent = v_u_972
                v975.Volume = math.random(1, 7) / 10
                v975:Play()
                game.Debris:AddItem(v975, 3)
            end
        end)
    end)
    for _, v_u_976 in pairs(v945:GetDescendants()) do
        if v_u_976:IsA("ParticleEmitter") then
            v_u_976:Emit(math.random(3, 8))
            task.delay(1, function()
                -- upvalues: (copy) v_u_976
                v_u_976.Enabled = false
            end)
        elseif v_u_976:IsA("Sound") then
            task.delay(0, function()
                -- upvalues: (copy) v_u_976
                v_u_976:Play()
                task.wait()
            end)
        elseif v_u_976:IsA("Beam") then
            task.spawn(function()
                -- upvalues: (copy) v_u_976
                for v977 = 0.5, 1, 0.01 do
                    v_u_976.Transparency = NumberSequence.new(v977, 1)
                    task.wait()
                end
            end)
        elseif v_u_976:IsA("MeshPart") or v_u_976:IsA("Part") then
            task.spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_976
                local v978 = v_u_2:Create(v_u_976, TweenInfo.new(0.3, Enum.EasingStyle.Quad, 1), {
                    ["Size"] = v_u_976.Size * 1.5
                })
                v978:Play()
                v978:Destroy()
                local v979 = v_u_2:Create(v_u_976, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                    ["Transparency"] = 1
                })
                v979:Play()
                v979:Destroy()
            end)
        end
    end
end
local function v_u_1009(p_u_981)
    -- upvalues: (copy) v_u_2
    p_u_981.Archivable = true
    local v_u_982 = p_u_981:clone()
    v_u_982.Parent = game.Lighting
    local v_u_983 = p_u_981.HumanoidRootPart
    p_u_981.Archivable = false
    task.spawn(function()
        -- upvalues: (copy) v_u_983, (copy) p_u_981, (ref) v_u_2
        v_u_983.SoruEmit.Enabled = true
        for _, v984 in pairs(p_u_981.Head:GetChildren()) do
            if v984:IsA("Decal") then
                v984.Transparency = 1
            end
        end
        for _, v_u_985 in pairs(p_u_981:GetDescendants()) do
            if v_u_985:IsA("BasePart") or (v_u_985:IsA("Part") or v_u_985:IsA("MeshPart")) then
                local v986 = v_u_2:Create(v_u_985, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                    ["Transparency"] = 1
                })
                v986:Play()
                v986:Destroy()
            elseif v_u_985:IsA("Accessory") then
                local v987 = v_u_2:Create(v_u_985.Handle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                    ["Transparency"] = 1
                })
                v987:Play()
                v987:Destroy()
            elseif v_u_985:IsA("Decal") then
                v_u_985.Transparency = 1
            end
            task.spawn(function()
                -- upvalues: (ref) p_u_981, (copy) v_u_985
                if not p_u_981:FindFirstChild("IFrame") then
                    if v_u_985:IsA("Sound") then
                        v_u_985:Stop()
                        return
                    end
                    if v_u_985:IsA("ParticleEmitter") and v_u_985.Name ~= "SoruEmit" then
                        v_u_985.Enabled = false
                        return
                    end
                    if v_u_985:IsA("Beam") then
                        v_u_985.Enabled = false
                        return
                    end
                    if v_u_985:IsA("Trail") then
                        v_u_985.Enabled = false
                        if v_u_985.Name == "normalTrail" then
                            task.delay(1, function()
                                -- upvalues: (ref) v_u_985
                                v_u_985.Enabled = true
                            end)
                        end
                    end
                end
            end)
        end
        task.spawn(function()
            -- upvalues: (ref) v_u_983
            task.wait(0.3)
            v_u_983.SoruEmit.Enabled = false
        end)
        task.wait(1)
        for _, v988 in pairs(p_u_981:GetDescendants()) do
            if v988.Name ~= "HumanoidRootPart" then
                if v988:IsA("BasePart") or (v988:IsA("Part") or v988:IsA("MeshPart")) then
                    if v988.Parent:FindFirstChild("bladeAttach") then
                        local v989 = v_u_2:Create(v988.Parent.Base, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                            ["Transparency"] = 0
                        })
                        v989:Play()
                        v989:Destroy()
                        v988.Parent.Blade.Transparency = 1
                        v988.Parent.Handle.Transparency = 1
                    else
                        local v990 = v_u_2:Create(v988, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                            ["Transparency"] = 0
                        })
                        v990:Play()
                        v990:Destroy()
                    end
                elseif v988:IsA("Accessory") then
                    local v991 = v_u_2:Create(v988.Handle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Transparency"] = 0
                    })
                    v991:Play()
                    v991:Destroy()
                elseif v988:IsA("Decal") then
                    v988.Transparency = 0
                end
            end
        end
        for _, v992 in pairs(p_u_981.Head:GetChildren()) do
            if v992:IsA("Decal") then
                v992.Transparency = 0
            end
        end
    end)
    v_u_983.Parent.Archivable = true
    local v_u_993 = v_u_982:clone()
    v_u_993.Parent = workspace.GarbageCollection
    local v994 = v_u_993.HumanoidRootPart
    local v995 = v_u_983.CFrame * CFrame.new(0, math.random(2, 4), 0)
    local v996 = CFrame.Angles
    local v997 = math.random(90, 360)
    local v998 = math.rad(v997)
    local v999 = math.random(90, 360)
    local v1000 = math.rad(v999)
    local v1001 = math.random(90, 360)
    v994.CFrame = v995 * v996(v998, v1000, (math.rad(v1001)))
    local v1002 = v_u_993.HumanoidRootPart
    v1002.CFrame = v1002.CFrame * CFrame.new(math.random(4, 4), 0, math.random(4, 4))
    v_u_993.Humanoid:Destroy()
    if v_u_993:FindFirstChild("FakeHead") then
        if v_u_993.FakeHead:FindFirstChild("face") then
            v_u_993.FakeHead.face:Destroy()
        end
    elseif v_u_993.Head:FindFirstChild("face") then
        v_u_993.Head.face:Destroy()
    end
    game.Debris:AddItem(v_u_993, 1.8)
    if v_u_993.Head:FindFirstChild("Dodges") then
        v_u_993.Head:FindFirstChild("Dodges"):Destroy()
    end
    p_u_981.Archivable = false
    task.spawn(function()
        -- upvalues: (copy) v_u_993, (ref) v_u_2, (copy) p_u_981
        for _, v_u_1003 in pairs(v_u_993:GetDescendants()) do
            if v_u_1003:IsA("BasePart") or (v_u_1003:IsA("Part") or v_u_1003:IsA("MeshPart")) then
                v_u_1003.Color = Color3.new(0.152941, 0.152941, 0.152941)
                v_u_1003.Anchored = true
                v_u_1003.CanCollide = false
                v_u_1003.Material = Enum.Material.Neon
                local v1004 = v_u_2:Create(v_u_1003, TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                    ["Transparency"] = 1,
                    ["Color"] = Color3.new(1, 1, 1)
                })
                v1004:Play()
                v1004:Destroy()
            elseif v_u_1003:IsA("Accessory") then
                local v1005
                if v_u_1003.Handle:FindFirstChild("Mesh") then
                    v1005 = v_u_1003.Handle:FindFirstChild("Mesh")
                    v1005.TextureId = ""
                    v1005.VertexColor = Vector3.new(0.152941, 0.152941, 0.152941)
                elseif v_u_1003.Handle:FindFirstChild("SpecialMesh") then
                    v1005 = v_u_1003.Handle:FindFirstChild("SpecialMesh")
                    v1005.TextureId = ""
                    v1005.VertexColor = Vector3.new(0.152941, 0.152941, 0.152941)
                else
                    v1005 = v_u_1003.Handle
                    v1005.TextureID = ""
                    v1005.Color = Color3.new(0.152941, 0.152941, 0.152941)
                end
                v_u_1003.Handle.Material = Enum.Material.Neon
                local v1006 = v_u_2:Create(v_u_1003.Handle, TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                    ["Transparency"] = 1
                })
                v1006:Play()
                v1006:Destroy()
                if v1005.Parent:FindFirstChild("Mesh") or v1005.Parent:FindFirstChild("SpecialMesh") then
                    local v1007 = v_u_2:Create(v1005, TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["VertexColor"] = Vector3.new(1, 1, 1)
                    })
                    v1007:Play()
                    v1007:Destroy()
                else
                    local v1008 = v_u_2:Create(v1005, TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Color"] = Color3.new(1, 1, 1)
                    })
                    v1008:Play()
                    v1008:Destroy()
                end
            elseif v_u_1003:IsA("Decal") then
                v_u_1003.Transparency = 1
            end
            task.spawn(function()
                -- upvalues: (ref) p_u_981, (copy) v_u_1003
                if not p_u_981:FindFirstChild("IFrame") then
                    if v_u_1003:IsA("Sound") then
                        v_u_1003:Stop()
                        return
                    end
                    if v_u_1003:IsA("ParticleEmitter") then
                        v_u_1003.Enabled = false
                        task.delay(1.5, function()
                            -- upvalues: (ref) v_u_1003
                            if v_u_1003.Name == "Insects" or v_u_1003.Name == "Insects2" then
                                v_u_1003.Enabled = true
                            end
                        end)
                        return
                    end
                    if v_u_1003:IsA("Trail") then
                        v_u_1003.Enabled = false
                        if v_u_1003.Name == "normalTrail" then
                            task.delay(1, function()
                                -- upvalues: (ref) v_u_1003
                                v_u_1003.Enabled = true
                            end)
                            return
                        end
                    elseif v_u_1003:IsA("Beam") then
                        v_u_1003.Enabled = false
                    end
                end
            end)
        end
    end)
    task.wait(0.04)
    task.delay(0.5, function()
        -- upvalues: (copy) v_u_982
        v_u_982:Destroy()
    end)
end
local function v_u_1018(p1010)
    -- upvalues: (copy) v_u_2
    local v_u_1011 = p1010.HumanoidRootPart
    local v_u_1012 = script.FlowerSlashes:clone()
    v_u_1012.Parent = workspace.GarbageCollection
    v_u_1012:SetPrimaryPartCFrame(v_u_1011.CFrame * CFrame.new(0, 0, -5) * CFrame.Angles(0, 1.5707963267948966, 0))
    game.Debris:AddItem(v_u_1012, 3)
    task.spawn(function()
        -- upvalues: (copy) v_u_1012, (copy) v_u_1011
        for _ = 1, 15 do
            v_u_1012:SetPrimaryPartCFrame(v_u_1011.CFrame * CFrame.new(0, 1, -5))
            task.wait(0.05)
        end
    end)
    for _, v_u_1013 in pairs(v_u_1012:GetChildren()) do
        task.spawn(function()
            -- upvalues: (ref) v_u_2, (copy) v_u_1013
            local v1014 = math.random(-1000, 1000)
            local v1015 = v_u_2:Create(v_u_1013, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ["CFrame"] = v_u_1013.CFrame * CFrame.Angles(0, math.rad(v1014), 0)
            })
            v1015:Play()
            v1015:Destroy()
            local v1016 = v_u_2:Create(v_u_1013, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ["Transparency"] = 1
            })
            v1016:Play()
            v1016:Destroy()
        end)
    end
    task.delay(2.5, function()
        -- upvalues: (copy) v_u_1012
        for _, v1017 in pairs(v_u_1012:GetDescendants()) do
            if v1017:IsA("ParticleEmitter") then
                v1017.Enabled = false
            end
        end
    end)
end
local function v_u_1023(p1019)
    if not p1019:IsA("Model") then
        p1019 = p1019.Character
    end
    local v1020 = p1019.HumanoidRootPart
    local v1021 = script.EXPLODEEE.woo:clone()
    v1021.Parent = v1020
    for _, v1022 in pairs(v1021:GetChildren()) do
        if v1022:IsA("ParticleEmitter") then
            v1022:Emit(v1022:GetAttribute("EmitCount"))
        else
            v1022:Play()
        end
    end
end
local function v_u_1030(p1024)
    -- upvalues: (copy) v_u_2
    if not p1024:IsA("Model") then
        p1024 = p1024.Character
    end
    local v1025 = p1024.HumanoidRootPart
    local v_u_1026 = script.crimsonSlash:clone()
    v_u_1026.CFrame = v1025.CFrame * CFrame.new(0, 0, -45) * CFrame.Angles(0, 0, 1.5707963267948966)
    v_u_1026.Parent = workspace.GarbageCollection
    task.spawn(function()
        -- upvalues: (copy) v_u_1026
        game.Debris:AddItem(v_u_1026, 5)
    end)
    for _, v_u_1027 in pairs(v_u_1026:GetChildren()) do
        if v_u_1027:IsA("ParticleEmitter") then
            v_u_1027.Enabled = true
            task.delay(0.5, function()
                -- upvalues: (copy) v_u_1027
                v_u_1027.Enabled = false
            end)
        elseif v_u_1027:IsA("Sound") then
            local v1028 = v_u_1027:clone()
            v1028.Parent = v1025
            v1028:Play()
            game.Debris:AddItem(v1028, 3)
        end
    end
    local v1029 = v_u_2:Create(v_u_1026, TweenInfo.new(0.45, Enum.EasingStyle.Linear), {
        ["CFrame"] = v1025.CFrame * CFrame.new(0, 0, 4) * CFrame.Angles(3.141592653589793, 3.141592653589793, 0),
        ["Transparency"] = 1
    })
    v1029:Play()
    v1029:Destroy()
end
local function v_u_1038(p1031)
    -- upvalues: (copy) v_u_2
    if not p1031:IsA("Model") then
        p1031 = p1031.Character
    end
    local v1032 = p1031.HumanoidRootPart
    local v_u_1033 = script.insectM1s:clone()
    v_u_1033:SetPrimaryPartCFrame(v1032.CFrame * CFrame.new(math.random(-1, 1), 0, math.random(-6, -4)) * CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966))
    v_u_1033.Parent = workspace.GarbageCollection
    game.Debris:AddItem(v_u_1033, 2)
    v_u_1033.poof.PlaybackSpeed = math.random(8, 11) / 10
    v_u_1033.poof:Play()
    task.delay(0.4, function()
        -- upvalues: (ref) v_u_2, (copy) v_u_1033
        local v1034 = v_u_2:Create(v_u_1033.innerShock, TweenInfo.new(0.45, Enum.EasingStyle.Linear), {
            ["Transparency"] = 1
        })
        v1034:Play()
        v1034:Destroy()
        local v1035 = v_u_2:Create(v_u_1033.particleShock, TweenInfo.new(0.45, Enum.EasingStyle.Linear), {
            ["Transparency"] = 1
        })
        v1035:Play()
        v1035:Destroy()
        for _, v_u_1036 in pairs(v_u_1033.PrimaryPart:GetChildren()) do
            if v_u_1036:IsA("ParticleEmitter") then
                v_u_1036.Enabled = false
            elseif v_u_1036:IsA("Beam") then
                task.spawn(function()
                    -- upvalues: (copy) v_u_1036
                    for v1037 = 0, 1, 0.5 do
                        v_u_1036.Transparency = NumberSequence.new(v1037, 1)
                        task.wait()
                    end
                end)
            end
        end
    end)
end
local function v_u_1051(p1039)
    -- upvalues: (copy) v_u_3, (copy) v_u_2
    if not p1039:IsA("Model") then
        p1039 = p1039.Character
    end
    local v1040 = p1039.HumanoidRootPart
    local v_u_1041 = v_u_3.ringPart:Clone()
    local v1042 = math.random(-666, 666)
    v_u_1041.CFrame = v1040.CFrame * CFrame.new(0, 0, -2) * CFrame.Angles(math.rad(v1042), math.rad(v1042), (math.rad(v1042)))
    v_u_1041.Parent = workspace.GarbageCollection
    v_u_1041.Size = Vector3.new(23.596, 0.4, 23.596)
    game.Debris:AddItem(v_u_1041, 3)
    task.delay(0.2, function()
        -- upvalues: (copy) v_u_1041
        v_u_1041.Whirl.Enabled = false
        v_u_1041.Whirl2.Enabled = false
    end)
    local v1043 = v_u_2:Create(v_u_1041, TweenInfo.new(0.4, Enum.EasingStyle.Linear), {
        ["Size"] = v_u_1041.Size * 2.3,
        ["Transparency"] = 1,
        ["CFrame"] = v_u_1041.CFrame * CFrame.Angles(math.rad(v1042), math.rad(v1042), (math.rad(v1042)))
    })
    v1043:Play()
    v1043:Destroy()
    local v_u_1044 = script.FlowerSkill:clone()
    v_u_1044.CFrame = v1040.CFrame * CFrame.new(0, 0, -3)
    v_u_1044.Parent = workspace.GarbageCollection
    game.Debris:AddItem(v_u_1044, 3)
    task.spawn(function()
        -- upvalues: (copy) v_u_1044
        for _, v_u_1045 in pairs(v_u_1044.main:GetDescendants()) do
            if v_u_1045:IsA("Beam") then
                task.delay(0.5, function()
                    -- upvalues: (copy) v_u_1045
                    for v1046 = 0, 1, 0.5 do
                        v_u_1045.Transparency = NumberSequence.new(v1046, 1)
                        task.wait()
                    end
                end)
            end
        end
    end)
    for _, v_u_1047 in pairs(v_u_1044:GetDescendants()) do
        if v_u_1047:IsA("ParticleEmitter") then
            v_u_1047:Emit(2)
            task.delay(0.8, function()
                -- upvalues: (copy) v_u_1047
                v_u_1047.Enabled = false
            end)
        elseif v_u_1047:IsA("Beam") then
            task.delay(0.5, function()
                -- upvalues: (copy) v_u_1047
                for v1048 = 0, 1, 0.5 do
                    v_u_1047.Transparency = NumberSequence.new(v1048, 1)
                    task.wait()
                end
            end)
        elseif v_u_1047:IsA("PointLight") then
            local v1049 = v_u_2:Create(v_u_1047, TweenInfo.new(0.6, Enum.EasingStyle.Linear), {
                ["Brightness"] = 0
            })
            v1049:Play()
            v1049:Destroy()
        elseif v_u_1047:IsA("Decal") then
            local v1050 = v_u_2:Create(v_u_1047, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
                ["Transparency"] = 1
            })
            v1050:Play()
            v1050:Destroy()
        end
    end
end
local function v_u_1060(p1052)
    -- upvalues: (copy) v_u_2
    if not p1052:IsA("Model") then
        p1052 = p1052.Character
    end
    local v1053 = p1052.HumanoidRootPart
    for _ = 1, 7 do
        local v_u_1054 = script.camellia:clone()
        v_u_1054.CFrame = v1053.CFrame * CFrame.new(math.random(-5, 5), math.random(-1, 3), math.random(-8, -5)) * CFrame.Angles(0.5235987755982988, 0.05235987755982989, -1.5707963267948966)
        v_u_1054.Parent = workspace.GarbageCollection
        game.Debris:AddItem(v_u_1054, 3)
        local v1055 = v_u_2:Create(v_u_1054, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
            ["CFrame"] = v_u_1054.CFrame * CFrame.new(-4, 0, -8)
        })
        v1055:Play()
        v1055:Destroy()
        task.spawn(function()
            -- upvalues: (copy) v_u_1054
            game.Debris:AddItem(v_u_1054, 5)
        end)
        for _, v_u_1056 in pairs(v_u_1054:GetDescendants()) do
            if v_u_1056:IsA("ParticleEmitter") then
                v_u_1056:Emit(2)
                task.delay(0.8, function()
                    -- upvalues: (copy) v_u_1056
                    v_u_1056.Enabled = false
                end)
            elseif v_u_1056:IsA("Beam") then
                task.delay(0.5, function()
                    -- upvalues: (copy) v_u_1056
                    for v1057 = 0, 1, 0.5 do
                        v_u_1056.Transparency = NumberSequence.new(v1057, 1)
                        task.wait()
                    end
                end)
            elseif v_u_1056:IsA("PointLight") then
                local v1058 = v_u_2:Create(v_u_1056, TweenInfo.new(0.6, Enum.EasingStyle.Linear), {
                    ["Brightness"] = 0
                })
                v1058:Play()
                v1058:Destroy()
            elseif v_u_1056:IsA("Decal") then
                local v1059 = v_u_2:Create(v_u_1056, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
                    ["Transparency"] = 1
                })
                v1059:Play()
                v1059:Destroy()
            end
        end
        task.wait(0.06)
    end
end
local function v_u_1069(p1061)
    -- upvalues: (copy) v_u_2
    if not p1061:IsA("Model") then
        p1061 = p1061.Character
    end
    local v1062 = p1061.HumanoidRootPart
    local v1063 = script.KanaM1:clone()
    v1063.CFrame = v1062.CFrame * CFrame.new(math.random(-3, 3), math.random(-1, 1), math.random(-8, -6)) * CFrame.Angles(0, 0, 1.5707963267948966)
    v1063.Parent = workspace.GarbageCollection
    game.Debris:AddItem(v1063, 2)
    v1063.WindImpact.PlaybackSpeed = math.random(9, 16) / 10
    v1063.WindImpact:play()
    for _, v1064 in pairs(v1063:GetChildren()) do
        if v1064:IsA("ParticleEmitter") then
            v1064:Emit(v1064:GetAttribute("EmitCount"))
        end
    end
    local v1065 = v_u_2:Create(v1063, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
        ["Transparency"] = 1
    })
    v1065:Play()
    v1065:Destroy()
    local v1066 = v_u_2:Create(v1063.Decal, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
        ["Transparency"] = 1
    })
    v1066:Play()
    v1066:Destroy()
    local v1067 = v_u_2:Create(v1063.PointLight, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
        ["Brightness"] = 0
    })
    v1067:Play()
    v1067:Destroy()
    for _, v1068 in pairs(v1063:GetChildren()) do
        if v1068:IsA("ParticleEmitter") then
            v1068.Enabled = false
        end
    end
end
local function v_u_1100(p1070)
    -- upvalues: (copy) v_u_2, (copy) v_u_233, (copy) v_u_16
    local v_u_1071 = p1070.Character
    local v_u_1072 = v_u_1071.HumanoidRootPart
    task.spawn(function()
        -- upvalues: (copy) v_u_1071, (copy) v_u_1072, (ref) v_u_2
        if v_u_1071:FindFirstChild("KatanaBlade") then
            v_u_1071:FindFirstChild("KatanaBlade").Blade.normalTrail.Enabled = false
        elseif v_u_1071:FindFirstChild("KokushiboKatanaBlade") then
            v_u_1071:FindFirstChild("KokushiboKatanaBlade").Blade.normalTrail.Enabled = false
        end
        task.spawn(function()
            -- upvalues: (ref) v_u_1072, (ref) v_u_1071, (ref) v_u_2
            v_u_1072.SoruEmit.Enabled = true
            if v_u_1071.Head:FindFirstChild("face") then
                v_u_1071.Head.face.Transparency = 1
            end
            for _, v_u_1073 in pairs(v_u_1071:GetDescendants()) do
                if v_u_1073:IsA("BasePart") or (v_u_1073:IsA("Part") or v_u_1073:IsA("MeshPart")) then
                    local v1074 = v_u_2:Create(v_u_1073, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Transparency"] = 1
                    })
                    v1074:Play()
                    v1074:Destroy()
                elseif v_u_1073:IsA("Accessory") then
                    local v1075 = v_u_2:Create(v_u_1073.Handle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                        ["Transparency"] = 1
                    })
                    v1075:Play()
                    v1075:Destroy()
                end
                if not v_u_1071:FindFirstChild("IFrame") then
                    if v_u_1073:IsA("Sound") then
                        v_u_1073:Stop()
                    elseif v_u_1073:IsA("ParticleEmitter") then
                        v_u_1073.Enabled = false
                        task.delay(1, function()
                            -- upvalues: (copy) v_u_1073
                            if v_u_1073.Name == "Insects" or v_u_1073.Name == "Insects2" then
                                v_u_1073.Enabled = true
                            end
                        end)
                    elseif v_u_1073:IsA("Trail") then
                        v_u_1073.Enabled = false
                        if v_u_1073.Name == "normalTrail" then
                            task.delay(1, function()
                                -- upvalues: (copy) v_u_1073
                                v_u_1073.Enabled = true
                            end)
                        end
                    elseif v_u_1073:IsA("Beam") then
                        v_u_1073.Enabled = false
                    elseif v_u_1073.Name == "Blade" and v_u_1073.Parent:FindFirstChild("normalTrail") then
                        v_u_1073.Parent.normalTrail.Enabled = false
                        task.delay(1, function()
                            -- upvalues: (copy) v_u_1073
                            v_u_1073.Parent.normalTrail.Enabled = true
                        end)
                    end
                end
            end
            task.spawn(function()
                -- upvalues: (ref) v_u_1072
                task.wait(0.3)
                v_u_1072.SoruEmit.Enabled = false
            end)
            task.wait(1)
            for _, v1076 in pairs(v_u_1071:GetDescendants()) do
                if v1076.Name ~= "HumanoidRootPart" then
                    if v1076:IsA("BasePart") or (v1076:IsA("Part") or v1076:IsA("MeshPart")) then
                        if v1076.Parent:FindFirstChild("bladeAttach") then
                            local v1077 = v_u_2:Create(v1076.Parent.Base, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                ["Transparency"] = 0
                            })
                            v1077:Play()
                            v1077:Destroy()
                            v1076.Parent.Blade.Transparency = 1
                            v1076.Parent.Handle.Transparency = 1
                        else
                            local v1078 = v_u_2:Create(v1076, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                ["Transparency"] = 0
                            })
                            v1078:Play()
                            v1078:Destroy()
                        end
                    elseif v1076:IsA("Accessory") then
                        local v1079 = v_u_2:Create(v1076.Handle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                            ["Transparency"] = 0
                        })
                        v1079:Play()
                        v1079:Destroy()
                    end
                end
            end
            if v_u_1071.Head:FindFirstChild("face") then
                v_u_1071.Head.face.Transparency = 0
            end
        end)
    end)
    task.wait(0.1)
    local v1080 = script.kanaDown:Clone()
    v1080.CFrame = v_u_1071.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5) * CFrame.Angles(-0.8726646259971648, 0, 0)
    v1080.Parent = workspace.GarbageCollection
    v1080.WindImpact:Play()
    v1080["Wind Tunnel"]:Play()
    local v_u_1081 = v_u_2
    task.delay(0, function()
        -- upvalues: (copy) v_u_1072, (ref) v_u_233, (copy) v_u_1071, (copy) v_u_1081
        local v_u_1082 = script.Trail:Clone()
        v_u_1082.Parent = workspace.GarbageCollection
        v_u_1082.Position = v_u_1072.Position - Vector3.new(0, 1, 0)
        game.Debris:AddItem(v_u_1082, 8)
        v_u_233(v_u_1082, v_u_1071.Torso)
        v_u_1081:Create(v_u_1082, TweenInfo.new(0.75), {
            ["Position"] = v_u_1082.Position + Vector3.new(0, 14.5, 0)
        }):Play()
        v_u_1081:Create(v_u_1082, TweenInfo.new(0.75), {
            ["Orientation"] = Vector3.new(0, 360, 0)
        }):Play()
        task.delay(0.75, function()
            -- upvalues: (copy) v_u_1082
            task.spawn(function()
                -- upvalues: (ref) v_u_1082
                for _, v1083 in pairs(v_u_1082.Left:GetChildren()) do
                    if v1083:IsA("ParticleEmitter") then
                        v1083.Enabled = false
                    end
                end
            end)
            v_u_1082.Left.Trail1.Enabled = false
            v_u_1082.Left.Trail2.Enabled = false
            v_u_1082.Left.Trail3.Enabled = false
            v_u_1082.Left.Trail4.Enabled = false
            task.spawn(function()
                -- upvalues: (ref) v_u_1082
                for _, v1084 in pairs(v_u_1082.Right:GetChildren()) do
                    if v1084:IsA("ParticleEmitter") then
                        v1084.Enabled = false
                    end
                end
            end)
            v_u_1082.Right.Trail1.Enabled = false
            v_u_1082.Right.Trail2.Enabled = false
            v_u_1082.Right.Trail3.Enabled = false
            v_u_1082.Right.Trail4.Enabled = false
            task.wait(5)
            v_u_1082:Destroy()
        end)
    end)
    task.delay(0.1, function()
        -- upvalues: (copy) v_u_1072, (ref) v_u_233, (copy) v_u_1071, (copy) v_u_1081
        local v_u_1085 = script.Trail:Clone()
        v_u_1085.Parent = workspace.GarbageCollection
        v_u_1085.Position = v_u_1072.Position - Vector3.new(0, 1, 0)
        v_u_233(v_u_1085, v_u_1071.Torso)
        game.Debris:AddItem(v_u_1085, 8)
        v_u_1081:Create(v_u_1085, TweenInfo.new(0.75), {
            ["Position"] = v_u_1085.Position + Vector3.new(0, 7.25, 0)
        }):Play()
        v_u_1081:Create(v_u_1085, TweenInfo.new(0.75), {
            ["Orientation"] = Vector3.new(0, -360, 0)
        }):Play()
        task.delay(0.75, function()
            -- upvalues: (copy) v_u_1085
            task.spawn(function()
                -- upvalues: (ref) v_u_1085
                for _, v1086 in pairs(v_u_1085.Left:GetChildren()) do
                    if v1086:IsA("ParticleEmitter") then
                        v1086.Enabled = false
                    end
                end
            end)
            v_u_1085.Left.Trail1.Enabled = false
            v_u_1085.Left.Trail2.Enabled = false
            v_u_1085.Left.Trail3.Enabled = false
            v_u_1085.Left.Trail4.Enabled = false
            task.spawn(function()
                -- upvalues: (ref) v_u_1085
                for _, v1087 in pairs(v_u_1085.Right:GetChildren()) do
                    if v1087:IsA("ParticleEmitter") then
                        v1087.Enabled = false
                    end
                end
            end)
            v_u_1085.Right.Trail1.Enabled = false
            v_u_1085.Right.Trail2.Enabled = false
            v_u_1085.Right.Trail3.Enabled = false
            v_u_1085.Right.Trail4.Enabled = false
            task.wait(5)
            v_u_1085:Destroy()
        end)
    end)
    task.delay(0.05, function()
        -- upvalues: (copy) v_u_1072, (ref) v_u_233, (copy) v_u_1071, (copy) v_u_1081
        local v_u_1088 = script.Trail:Clone()
        v_u_1088.Parent = workspace.GarbageCollection
        v_u_1088.Position = v_u_1072.Position - Vector3.new(0, 1, 0)
        v_u_233(v_u_1088, v_u_1071.Torso)
        game.Debris:AddItem(v_u_1088, 8)
        v_u_1081:Create(v_u_1088, TweenInfo.new(0.75), {
            ["Position"] = v_u_1088.Position + Vector3.new(0, 3.625, 0)
        }):Play()
        v_u_1081:Create(v_u_1088, TweenInfo.new(0.75), {
            ["Orientation"] = Vector3.new(0, 360, 0)
        }):Play()
        task.delay(0.75, function()
            -- upvalues: (copy) v_u_1088
            task.spawn(function()
                -- upvalues: (ref) v_u_1088
                for _, v1089 in pairs(v_u_1088.Left:GetChildren()) do
                    if v1089:IsA("ParticleEmitter") then
                        v1089.Enabled = false
                    end
                end
            end)
            v_u_1088.Left.Trail1.Enabled = false
            v_u_1088.Left.Trail2.Enabled = false
            v_u_1088.Left.Trail3.Enabled = false
            v_u_1088.Left.Trail4.Enabled = false
            task.spawn(function()
                -- upvalues: (ref) v_u_1088
                for _, v1090 in pairs(v_u_1088.Right:GetChildren()) do
                    if v1090:IsA("ParticleEmitter") then
                        v1090.Enabled = false
                    end
                end
            end)
            v_u_1088.Right.Trail1.Enabled = false
            v_u_1088.Right.Trail2.Enabled = false
            v_u_1088.Right.Trail3.Enabled = false
            v_u_1088.Right.Trail4.Enabled = false
            task.wait(5)
            v_u_1088:Destroy()
        end)
    end)
    game.Debris:AddItem(v1080, 1.5)
    task.delay(0.1, function()
        -- upvalues: (copy) v_u_1072, (ref) v_u_16
        local v_u_1091 = script.groundSmoke:Clone()
        v_u_1091.CFrame = v_u_1072.CFrame * CFrame.new(0, -1, 0)
        v_u_1091.Parent = workspace.GarbageCollection
        for _, v1092 in pairs(v_u_1091.Attachment:GetChildren()) do
            v1092:Emit(1)
        end
        task.spawn(function()
            -- upvalues: (copy) v_u_1091
            for _, v1093 in pairs(script.groundSFX:GetChildren()) do
                local v1094 = v1093:Clone()
                v1094.Parent = v_u_1091
                v1094.Volume = math.random(1, 7) / 10
                v1094:Play()
                game.Debris:AddItem(v1094, 3)
            end
        end)
        v_u_16({
            ["Origin"] = v_u_1072.CFrame * CFrame.new(0, 1, 0),
            ["Radius"] = 10,
            ["Amount"] = 10,
            ["Size"] = Vector3.new(2, 3, 2)
        })
    end)
    for _, v_u_1095 in pairs(v1080:GetDescendants()) do
        if v_u_1095:IsA("ParticleEmitter") then
            v_u_1095:Emit(v_u_1095:GetAttribute("EmitCount"))
            task.delay(1, function()
                -- upvalues: (copy) v_u_1095
                v_u_1095.Enabled = false
            end)
        elseif v_u_1095:IsA("Sound") then
            task.delay(0, function()
                -- upvalues: (copy) v_u_1095
                v_u_1095:Play()
                task.wait()
            end)
        elseif v_u_1095:IsA("Beam") then
            task.spawn(function()
                -- upvalues: (copy) v_u_1095
                for v1096 = 0.5, 1, 0.01 do
                    v_u_1095.Transparency = NumberSequence.new(v1096, 1)
                    task.wait()
                end
            end)
        elseif v_u_1095:IsA("Decal") then
            task.spawn(function()
                -- upvalues: (copy) v_u_1095
                for v1097 = 0.5, 1, 0.01 do
                    v_u_1095.Transparency = v1097
                    task.wait()
                end
            end)
        elseif v_u_1095:IsA("MeshPart") or v_u_1095:IsA("Part") then
            task.spawn(function()
                -- upvalues: (ref) v_u_2, (copy) v_u_1095
                local v1098 = v_u_2:Create(v_u_1095, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                    ["Size"] = v_u_1095.Size * 1.3
                })
                v1098:Play()
                v1098:Destroy()
                task.wait(0.4)
                local v1099 = v_u_2:Create(v_u_1095, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                    ["Transparency"] = 1
                })
                v1099:Play()
                v1099:Destroy()
            end)
        end
    end
end
local function v_u_1115(p1101)
    -- upvalues: (copy) v_u_2
    for _ = 1, 2 do
        local v_u_1102 = script.lotus:Clone()
        local v1103 = p1101.CFrame * CFrame.new(math.random(-7, 7), math.random(-2, 3), math.random(-10, -3))
        local v1104 = CFrame.Angles
        local v1105 = math.random(-85, 85)
        local v1106 = math.rad(v1105)
        local v1107 = math.random(-85, 85)
        local v1108 = math.rad(v1107)
        local v1109 = math.random(-85, 85)
        v_u_1102:SetPrimaryPartCFrame(v1103 * v1104(v1106, v1108, (math.rad(v1109))))
        v_u_1102.Parent = workspace.GarbageCollection
        task.spawn(function()
            -- upvalues: (copy) v_u_1102
            game.Debris:AddItem(v_u_1102, 5)
        end)
        task.spawn(function()
            -- upvalues: (copy) v_u_1102, (ref) v_u_2
            for v_u_1110 = 1, 7 do
                task.spawn(function()
                    -- upvalues: (ref) v_u_1102, (copy) v_u_1110
                    for _, v1111 in pairs(v_u_1102:FindFirstChild(v_u_1110):GetChildren()) do
                        if v1111:IsA("ParticleEmitter") then
                            if v1111.Parent.Name == "1" then
                                v1111:Emit(5)
                                task.wait(0.005)
                            else
                                task.wait(0.05)
                                v1111:Emit(5)
                                task.wait(0.005)
                            end
                        elseif v1111:IsA("Sound") then
                            v1111:Play()
                        end
                    end
                end)
                if v_u_1110 ~= 1 then
                    v_u_1102:FindFirstChild(v_u_1110).Mesh.MeshType = Enum.MeshType.Brick
                end
                task.delay(0.05, function()
                    -- upvalues: (ref) v_u_2, (ref) v_u_1102, (copy) v_u_1110
                    v_u_2:Create(v_u_1102:FindFirstChild(v_u_1110), TweenInfo.new(0.1), {
                        ["Transparency"] = 0.5
                    }):Play()
                end)
                task.wait(0.03)
            end
            for _, v1112 in pairs(v_u_1102:GetChildren()) do
                if v1112.Name == "LotusMesh" then
                    v_u_2:Create(v1112, TweenInfo.new(0.1), {
                        ["Transparency"] = 0
                    }):Play()
                end
            end
        end)
        task.wait(0.6)
        task.spawn(function()
            -- upvalues: (copy) v_u_1102, (ref) v_u_2
            task.spawn(function()
                -- upvalues: (ref) v_u_1102, (ref) v_u_2
                for _, v1113 in pairs(v_u_1102:GetChildren()) do
                    if v1113.Name == "LotusMesh" then
                        v1113.Anchored = false
                        v1113.CanCollide = false
                        v_u_2:Create(v1113, TweenInfo.new(0.5), {
                            ["Transparency"] = 1
                        }):Play()
                        game.Debris:AddItem(v1113, 3)
                        task.wait(0.06)
                    end
                end
            end)
            for v_u_1114 = 1, 7 do
                if v_u_1114 ~= 1 then
                    v_u_1102:FindFirstChild(v_u_1114).Mesh.MeshType = Enum.MeshType.Brick
                end
                task.delay(0.05, function()
                    -- upvalues: (ref) v_u_1102, (copy) v_u_1114, (ref) v_u_2
                    if v_u_1102:FindFirstChild(v_u_1114) and v_u_1102:FindFirstChild(v_u_1114).Anchored then
                        v_u_1102:FindFirstChild(v_u_1114).Anchored = false
                    end
                    v_u_1102:FindFirstChild(v_u_1114).CanCollide = false
                    task.wait(0.14)
                    v_u_2:Create(v_u_1102:FindFirstChild(v_u_1114), TweenInfo.new(0.5), {
                        ["Transparency"] = 1
                    }):Play()
                    game.Debris:AddItem(v_u_1102:FindFirstChild(v_u_1114), 3)
                end)
                task.wait(0.05)
            end
        end)
        task.wait(0.03)
    end
end
local function v_u_1130(p_u_1116, p1117)
    local v_u_1118 = p_u_1116.Humanoid
    p_u_1116.HumanoidRootPart.CFrame = p1117
    for _, v_u_1119 in pairs(p_u_1116:GetChildren()) do
        if v_u_1119:IsA("BasePart") and v_u_1119.Name ~= "HumanoidRootPart" then
            task.spawn(function()
                -- upvalues: (copy) v_u_1119, (copy) v_u_1118, (copy) p_u_1116
                local v1120 = script.Ice:Clone()
                v1120.CanCollide = false
                v_u_1119.Anchored = true
                v1120.Transparency = 0.3
                v1120.Size = Vector3.new(2.6, 2.6, 2.6)
                local v1121 = CFrame.new(v_u_1119.Position)
                local v1122 = CFrame.Angles
                local v1123 = math.random(0, 360)
                local v1124 = math.rad(v1123)
                local v1125 = math.random(0, 360)
                local v1126 = math.rad(v1125)
                local v1127 = math.random(0, 360)
                v1120.CFrame = v1121 * v1122(v1124, v1126, (math.rad(v1127)))
                v1120.Parent = game.Workspace.GarbageCollection
                v1120.Anchored = true
                v1120.Sound:Play()
                local v1128 = v_u_1118.Health
                local v1129 = tick()
                repeat
                    task.wait(0.2)
                until tick() - v1129 > 3 or (v_u_1118.Health < v1128 or p_u_1116:FindFirstChild("IFrame"))
                v_u_1119.Anchored = false
                v1120.Shatter:Play()
                v1120.Breakfx:Emit(2)
                v1120.Transparency = 1
                game.Debris:AddItem(v1120, 2)
            end)
            task.wait()
        elseif v_u_1119:IsA("BodyVelocity") then
            v_u_1119:Destroy()
        end
    end
end
local function v_u_1144(p1131, p1132)
    local v_u_1133 = p1131.Humanoid
    p1131.HumanoidRootPart.CFrame = p1132
    for _, v_u_1134 in pairs(p1131:GetChildren()) do
        if v_u_1134:IsA("BasePart") and (v_u_1134.Name ~= "Head" and v_u_1134.Name ~= "HumanoidRootPart") then
            task.spawn(function()
                -- upvalues: (copy) v_u_1134, (copy) v_u_1133
                local v1135 = script.Ice:Clone()
                v1135.CanCollide = false
                v_u_1134.Anchored = true
                v1135.Transparency = 0.3
                v1135.Size = Vector3.new(2.8, 2.8, 2.8)
                local v1136 = CFrame.new(v_u_1134.Position)
                local v1137 = CFrame.Angles
                local v1138 = math.random(0, 360)
                local v1139 = math.rad(v1138)
                local v1140 = math.random(0, 360)
                local v1141 = math.rad(v1140)
                local v1142 = math.random(0, 360)
                v1135.CFrame = v1136 * v1137(v1139, v1141, (math.rad(v1142)))
                v1135.Parent = game.Workspace.GarbageCollection
                v1135.Anchored = true
                v1135.Sound:Play()
                local _ = v_u_1133.Health
                local v1143 = tick()
                repeat
                    task.wait(0.2)
                until tick() - v1143 > 3
                v_u_1134.Anchored = false
                v1135.Shatter:Play()
                v1135.Breakfx:Emit(2)
                v1135.Transparency = 1
                game.Debris:AddItem(v1135, 2)
            end)
            task.wait()
        elseif v_u_1134:IsA("BasePart") then
            v_u_1134.Transparency = 0.3
            v_u_1134.Material = Enum.Material.Ice
            v_u_1134.Color = Color3.new(0.0313725, 0.917647, 1)
        end
    end
end
local function v_u_1148(p_u_1145, _)
    for _ = 1, 5 do
        if not p_u_1145 then
            break
        end
        local v_u_1146 = script.gun:Clone()
        v_u_1146.Parent = game.Workspace.GarbageCollection
        task.spawn(function()
            -- upvalues: (copy) v_u_1146
            game.Debris:AddItem(v_u_1146, 4)
        end)
        v_u_1146.CFrame = p_u_1145.HumanoidRootPart.CFrame * CFrame.new(math.random(-6, 6), math.random(-1, 3), 0)
        task.spawn(function()
            -- upvalues: (copy) v_u_1146, (copy) p_u_1145
            for _ = 1, 10 do
                v_u_1146.CFrame = CFrame.lookAt(v_u_1146.Position, p_u_1145.HumanoidRootPart.Position)
                task.wait()
            end
        end)
        v_u_1146.Attachment.Sound:Play()
        for _, v1147 in pairs(v_u_1146.Attachment:GetChildren()) do
            if v1147:IsA("ParticleEmitter") then
                v1147:Emit(v1147:GetAttribute("EmitCount"))
            end
        end
        game.Debris:AddItem(v_u_1146, 2)
        task.wait(0.2)
    end
end
local function v_u_1165(p1149)
    local v_u_1150 = Random.new()
    if not p1149:IsA("Model") then
        p1149 = p1149.Character
    end
    local v1151 = p1149.HumanoidRootPart
    if math.random(1, 6) == 3 then
        local v1152 = v1151.Position
        local v_u_1153 = Instance.new("Part")
        v_u_1153.Name = "Raindrop"
        v_u_1153.CastShadow = false
        v_u_1153.Transparency = 0.6
        v_u_1153.Color = Color3.new(0.772549, 0.921569, 1)
        v_u_1153.Material = Enum.Material.Neon
        v_u_1153.Anchored = false
        v_u_1153.Size = Vector3.new(0.15, 2, 0.15)
        local v1154 = v_u_1150:NextNumber(-15, 15)
        v_u_1153.Position = v1152 + Vector3.new(v1154, 3, v_u_1150:NextNumber(-15, 15))
        v_u_1153.Parent = game.Workspace.GarbageCollection
        game.TweenService:Create(v_u_1153, TweenInfo.new(0.03, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            ["Position"] = v_u_1153.Position - Vector3.new(0, 45, 0),
            ["Transparency"] = 1,
            ["Size"] = Vector3.new(0.15, 4, 0.15)
        }):Play()
        local v_u_1155 = nil
        v_u_1155 = v_u_1153.Touched:Connect(function(p1156)
            -- upvalues: (copy) v_u_1153, (copy) v_u_1150, (ref) v_u_1155
            if p1156.Parent ~= game.Workspace.GarbageCollection then
                game.Debris:AddItem(v_u_1153, 0.00001)
                local v_u_1157 = script.FrostFloor:Clone()
                v_u_1157.Position = v_u_1153.Position + Vector3.new(0, -0.5, 0)
                if math.random(1, 5) == 1 then
                    v_u_1157.Material = Enum.Material.Glacier
                elseif math.random(1, 5) == 2 then
                    v_u_1157.Material = Enum.Material.Ice
                end
                v_u_1157.Parent = game.Workspace.GarbageCollection
                game.Debris:AddItem(v_u_1157, 4)
                local v1158 = game.TweenService
                local v1159 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                local v1160 = {
                    ["Transparency"] = 0.5
                }
                local v1161 = v_u_1150:NextNumber(5, 15)
                local v1162 = v_u_1150
                v1160.Size = Vector3.new(1, v1161, v1162:NextNumber(5, 15))
                v1158:Create(v_u_1157, v1159, v1160):Play()
                task.delay(5, function()
                    -- upvalues: (copy) v_u_1157
                    game.TweenService:Create(v_u_1157, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                        ["Transparency"] = 1,
                        ["Size"] = Vector3.new(0, 0, 0)
                    }):Play()
                    game.Debris:AddItem(v_u_1157, 0.5)
                end)
                if math.random(1, 2) == 2 then
                    local v_u_1163 = script.Blooming:Clone()
                    v_u_1163.Position = v_u_1153.Position + Vector3.new(0, 1, 0)
                    v_u_1163.Parent = game.Workspace.GarbageCollection
                    game.Debris:AddItem(v_u_1163, 4)
                    game.TweenService:Create(v_u_1163, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                        ["Transparency"] = 0,
                        ["Size"] = Vector3.new(3.358, 1.393, 3.429),
                        ["CFrame"] = v_u_1163.CFrame * CFrame.Angles(v_u_1150:NextNumber(-15, 15), 160, v_u_1150:NextNumber(-15, 15))
                    }):Play()
                    task.spawn(function()
                        -- upvalues: (copy) v_u_1163
                        task.wait(0.7)
                        for _, v_u_1164 in pairs(v_u_1163:GetChildren()) do
                            if v_u_1164:IsA("ParticleEmitter") then
                                v_u_1164:Emit(v_u_1164:GetAttribute("EmitCount"))
                            elseif v_u_1164:IsA("PointLight") then
                                v_u_1164.Enabled = true
                                task.delay(0.45, function()
                                    -- upvalues: (copy) v_u_1164
                                    v_u_1164.Enabled = false
                                end)
                            end
                        end
                    end)
                    task.delay(5, function()
                        -- upvalues: (copy) v_u_1163, (ref) v_u_1150
                        game.TweenService:Create(v_u_1163, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                            ["Transparency"] = 1,
                            ["Size"] = Vector3.new(0, 0, 0),
                            ["CFrame"] = v_u_1163.CFrame * CFrame.Angles(v_u_1150:NextNumber(-15, 15), 160, v_u_1150:NextNumber(-15, 15))
                        }):Play()
                        game.Debris:AddItem(v_u_1163, 0.5)
                    end)
                end
                v_u_1155:Disconnect()
            end
        end)
    end
end
local function v_u_1181(p1166)
    local v_u_1167 = Random.new()
    if not p1166:IsA("Model") then
        p1166 = p1166.Character
    end
    local v1168 = p1166.HumanoidRootPart.Position
    local v_u_1169 = Instance.new("Part")
    v_u_1169.Name = "Raindrop"
    v_u_1169.CastShadow = false
    v_u_1169.Transparency = 0.6
    v_u_1169.Color = Color3.new(0.772549, 0.921569, 1)
    v_u_1169.Material = Enum.Material.Neon
    v_u_1169.Anchored = false
    v_u_1169.Size = Vector3.new(0.15, 2, 0.15)
    local v1170 = v_u_1167:NextNumber(-15, 15)
    v_u_1169.Position = v1168 + Vector3.new(v1170, 3, v_u_1167:NextNumber(-15, 15))
    v_u_1169.Parent = game.Workspace.GarbageCollection
    game.TweenService:Create(v_u_1169, TweenInfo.new(0.03, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        ["Position"] = v_u_1169.Position - Vector3.new(0, 45, 0),
        ["Transparency"] = 1,
        ["Size"] = Vector3.new(0.15, 4, 0.15)
    }):Play()
    local v_u_1171 = nil
    v_u_1171 = v_u_1169.Touched:Connect(function(p1172)
        -- upvalues: (copy) v_u_1169, (copy) v_u_1167, (ref) v_u_1171
        if p1172.Parent ~= game.Workspace.GarbageCollection then
            game.Debris:AddItem(v_u_1169, 0.00001)
            local v_u_1173 = script.FrostFloor:Clone()
            v_u_1173.CanCollide = false
            v_u_1173.Position = v_u_1169.Position + Vector3.new(0, -0.5, 0)
            if math.random(1, 5) == 1 then
                v_u_1173.Material = Enum.Material.Glacier
            elseif math.random(1, 5) == 2 then
                v_u_1173.Material = Enum.Material.Ice
            end
            v_u_1173.Parent = game.Workspace.GarbageCollection
            game.Debris:AddItem(v_u_1173, 5)
            local v1174 = game.TweenService
            local v1175 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
            local v1176 = {
                ["Transparency"] = 0.5
            }
            local v1177 = v_u_1167:NextNumber(5, 15)
            local v1178 = v_u_1167
            v1176.Size = Vector3.new(1, v1177, v1178:NextNumber(5, 15))
            v1174:Create(v_u_1173, v1175, v1176):Play()
            task.delay(5, function()
                -- upvalues: (copy) v_u_1173
                game.TweenService:Create(v_u_1173, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    ["Transparency"] = 1,
                    ["Size"] = Vector3.new(0, 0, 0)
                }):Play()
                game.Debris:AddItem(v_u_1173, 1.5)
            end)
            if math.random(1, 2) == 2 then
                local v_u_1179 = script.Blooming:Clone()
                v_u_1179.Position = v_u_1169.Position + Vector3.new(0, 1, 0)
                v_u_1179.Parent = game.Workspace.GarbageCollection
                v_u_1179.CanCollide = false
                game.Debris:AddItem(v_u_1179, 4)
                game.TweenService:Create(v_u_1179, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    ["Transparency"] = 0,
                    ["Size"] = Vector3.new(6, 1.393, 6),
                    ["CFrame"] = v_u_1179.CFrame * CFrame.Angles(v_u_1167:NextNumber(-15, 15), 160, v_u_1167:NextNumber(-15, 15))
                }):Play()
                task.spawn(function()
                    -- upvalues: (copy) v_u_1179
                    task.wait(0.7)
                    for _, v_u_1180 in pairs(v_u_1179:GetChildren()) do
                        if v_u_1180:IsA("ParticleEmitter") then
                            v_u_1180:Emit(v_u_1180:GetAttribute("EmitCount"))
                        elseif v_u_1180:IsA("PointLight") then
                            v_u_1180.Enabled = true
                            task.delay(0.45, function()
                                -- upvalues: (copy) v_u_1180
                                v_u_1180.Enabled = false
                            end)
                        end
                    end
                end)
                task.delay(5, function()
                    -- upvalues: (copy) v_u_1179, (ref) v_u_1167
                    game.TweenService:Create(v_u_1179, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                        ["Transparency"] = 1,
                        ["Size"] = Vector3.new(0, 0, 0),
                        ["CFrame"] = v_u_1179.CFrame * CFrame.Angles(v_u_1167:NextNumber(-15, 15), 160, v_u_1167:NextNumber(-15, 15))
                    }):Play()
                    game.Debris:AddItem(v_u_1179, 1.5)
                end)
            end
            v_u_1171:Disconnect()
        end
    end)
end
local function v_u_1188(p1182, p1183)
    if not p1182:IsA("Model") then
        p1182 = p1182.Character
    end
    local v1184 = p1182.HumanoidRootPart
    local v_u_1185 = script.whirlwindCutter2:Clone()
    v_u_1185.Parent = workspace.GarbageCollection
    v_u_1185.CFrame = v1184.CFrame * CFrame.new(0, -1, 0) * CFrame.Angles(0, -1.5707963267948966, -1.5707963267948966)
    local v1186 = script.WhirlwindCutter:Clone()
    v1186.Parent = workspace.GarbageCollection
    v1186.CFrame = p1183
    task.spawn(function()
        -- upvalues: (copy) v_u_1185
        game.TweenService:Create(v_u_1185, TweenInfo.new(0.51, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["Size"] = v_u_1185.Size * 2.5,
            ["CFrame"] = v_u_1185.CFrame * CFrame.Angles(0, 0, 3.141592653589793)
        }):Play()
        game.TweenService:Create(v_u_1185.Decal, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["Transparency"] = 1
        }):Play()
        game.TweenService:Create(v_u_1185.Decal2, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["Transparency"] = 1
        }):Play()
    end)
    for _, v1187 in pairs(v1186:GetDescendants()) do
        if v1187:IsA("ParticleEmitter") then
            v1187:Emit(v1187:GetAttribute("EmitCount"))
        end
    end
    game.TweenService:Create(v1186, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        ["Transparency"] = 1,
        ["Size"] = Vector3.new(29, 0, 0)
    }):Play()
    game.Debris:AddItem(v1186, 4)
    game.Debris:AddItem(v_u_1185, 4)
end
local function v_u_1196(p1189)
    if not p1189:IsA("Model") then
        p1189 = p1189.Character
    end
    local v1190 = p1189.HumanoidRootPart
    local v_u_1191 = script.windClaws:Clone()
    v_u_1191.Name = "claw" .. math.random()
    v_u_1191.Parent = workspace.GarbageCollection
    v_u_1191.CFrame = v1190.CFrame * CFrame.new(2, 4.3, -5) * CFrame.Angles(0.17453292519943295, 3.141592653589793, 1.7453292519943295)
    v_u_1191.Anchored = true
    task.spawn(function()
        -- upvalues: (copy) v_u_1191
        game.Debris:AddItem(v_u_1191, 5)
    end)
    task.spawn(function()
        -- upvalues: (copy) v_u_1191
        local v1192 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        game:GetService("TweenService"):Create(v_u_1191, v1192, {
            ["CFrame"] = v_u_1191.CFrame * CFrame.Angles(0, -1.5707963267948966, 0)
        }):Play()
    end)
    task.spawn(function()
        -- upvalues: (copy) v_u_1191
        for _, v1193 in pairs(v_u_1191:GetDescendants()) do
            if v1193:IsA("ParticleEmitter") then
                v1193:Emit(v1193:GetAttribute("EmitCount"))
                task.wait(0.001)
            end
        end
    end)
    task.delay(0.05, function()
        -- upvalues: (copy) v_u_1191
        for _, v1194 in pairs(v_u_1191:GetDescendants()) do
            if v1194:IsA("Beam") then
                local v1195 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                game:GetService("TweenService"):Create(v1194, v1195, {
                    ["Width0"] = 0,
                    ["Width1"] = 0
                }):Play()
            elseif v1194:IsA("ParticleEmitter") then
                v1194.Enabled = false
            end
        end
        game.Debris:AddItem(v_u_1191, 5)
    end)
end
local function v_u_1201(p1197)
    if not p1197:IsA("Model") then
        p1197 = p1197.Character
    end
    local v1198 = p1197.HumanoidRootPart
    local v_u_1199 = script.Wind2:Clone()
    v_u_1199.Parent = workspace.GarbageCollection
    v_u_1199.CFrame = v1198.CFrame * CFrame.new(0, 2, -5) * CFrame.Angles(0, 1.5707963267948966, -1.5707963267948966)
    game.Debris:AddItem(v_u_1199, 3)
    local v_u_1200 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    task.spawn(function()
        -- upvalues: (copy) v_u_1199, (copy) v_u_1200
        game:GetService("TweenService"):Create(v_u_1199.Mesh, v_u_1200, {
            ["Scale"] = v_u_1199.Mesh.Scale * 2.4
        }):Play()
    end)
    game:GetService("TweenService"):Create(v_u_1199, v_u_1200, {
        ["CFrame"] = v_u_1199.CFrame * CFrame.Angles(0, 2.443460952792061, 0),
        ["Transparency"] = 0.5
    }):Play()
    task.wait(0.1)
    game:GetService("TweenService"):Create(v_u_1199, v_u_1200, {
        ["CFrame"] = v_u_1199.CFrame * CFrame.Angles(0, 2.443460952792061, 0),
        ["Transparency"] = 1
    }):Play()
end
local function v_u_1210(p1202, p1203)
    if not p1202:IsA("Model") then
        p1202 = p1202.Character
    end
    if p1203 == true then
        local v1204 = p1202.HumanoidRootPart
        local v_u_1205 = script.nezukoWind:Clone()
        v_u_1205.Parent = workspace.GarbageCollection
        v_u_1205.CFrame = v1204.CFrame * CFrame.new(0, 0, 0) * CFrame.Angles(0, 3.141592653589793, 1.5707963267948966)
        game.Debris:AddItem(v_u_1205, 3)
        local v_u_1206 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        task.spawn(function()
            -- upvalues: (copy) v_u_1205, (copy) v_u_1206
            game:GetService("TweenService"):Create(v_u_1205.Mesh, v_u_1206, {
                ["Scale"] = v_u_1205.Mesh.Scale * 1.3
            }):Play()
        end)
        game:GetService("TweenService"):Create(v_u_1205, v_u_1206, {
            ["CFrame"] = v_u_1205.CFrame * CFrame.Angles(0, 2.443460952792061, 0),
            ["Transparency"] = 0.5
        }):Play()
        task.wait(0.1)
        game:GetService("TweenService"):Create(v_u_1205, v_u_1206, {
            ["CFrame"] = v_u_1205.CFrame * CFrame.Angles(0, 2.443460952792061, 0),
            ["Transparency"] = 1
        }):Play()
    else
        local v1207 = p1202.HumanoidRootPart
        local v_u_1208 = script.nezukoWind:Clone()
        v_u_1208.Parent = workspace.GarbageCollection
        v_u_1208.CFrame = v1207.CFrame * CFrame.new(0, 2, 0) * CFrame.Angles(0, 1.5707963267948966, 0)
        game.Debris:AddItem(v_u_1208, 3)
        local v_u_1209 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        task.spawn(function()
            -- upvalues: (copy) v_u_1208, (copy) v_u_1209
            game:GetService("TweenService"):Create(v_u_1208.Mesh, v_u_1209, {
                ["Scale"] = v_u_1208.Mesh.Scale * 1.3
            }):Play()
        end)
        game:GetService("TweenService"):Create(v_u_1208, v_u_1209, {
            ["CFrame"] = v_u_1208.CFrame * CFrame.Angles(0, 2.443460952792061, 0),
            ["Transparency"] = 0.5
        }):Play()
        task.wait(0.1)
        game:GetService("TweenService"):Create(v_u_1208, v_u_1209, {
            ["CFrame"] = v_u_1208.CFrame * CFrame.Angles(0, 2.443460952792061, 0),
            ["Transparency"] = 1
        }):Play()
    end
end
local function v_u_1225(p1211)
    if not p1211:IsA("Model") then
        p1211 = p1211.Character
    end
    local v1212 = p1211.HumanoidRootPart
    local v_u_1213 = script.windTornado:Clone()
    v_u_1213.Parent = workspace.GarbageCollection
    v_u_1213:SetPrimaryPartCFrame(v1212.CFrame * CFrame.new(0, -2.5, 0))
    task.spawn(function()
        -- upvalues: (copy) v_u_1213
        game.Debris:AddItem(v_u_1213, 3)
    end)
    local v_u_1214 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    task.spawn(function()
        -- upvalues: (copy) v_u_1213, (copy) v_u_1214
        game:GetService("TweenService"):Create(v_u_1213.Wind1, v_u_1214, {
            ["Size"] = v_u_1213.Wind1.Size * 1.3
        }):Play()
        game:GetService("TweenService"):Create(v_u_1213.Wind1, v_u_1214, {
            ["CFrame"] = v_u_1213.Wind1.CFrame * CFrame.Angles(0, 8.726646259971648, 0)
        }):Play()
        for _, v1215 in pairs(v_u_1213.Wind1:GetChildren()) do
            game:GetService("TweenService"):Create(v1215, v_u_1214, {
                ["Transparency"] = 1
            }):Play()
        end
    end)
    task.spawn(function()
        -- upvalues: (copy) v_u_1213, (copy) v_u_1214
        game:GetService("TweenService"):Create(v_u_1213.Wind2.Mesh, v_u_1214, {
            ["Scale"] = v_u_1213.Wind2.Mesh.Scale * 3
        }):Play()
        game:GetService("TweenService"):Create(v_u_1213.Wind2, v_u_1214, {
            ["CFrame"] = v_u_1213.Wind2.CFrame * CFrame.Angles(0, 8.726646259971648, 0),
            ["Transparency"] = 1
        }):Play()
    end)
    task.spawn(function()
        -- upvalues: (copy) v_u_1213
        for _, v_u_1216 in pairs(v_u_1213:GetDescendants()) do
            if v_u_1216:IsA("Beam") then
                task.delay(0.3, function()
                    -- upvalues: (copy) v_u_1216
                    local v1217 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                    game:GetService("TweenService"):Create(v_u_1216, v1217, {
                        ["Width0"] = 0,
                        ["Width1"] = 0
                    }):Play()
                end)
            elseif v_u_1216:IsA("ParticleEmitter") then
                v_u_1216:Emit(v_u_1216:GetAttribute("EmitCount"))
                task.wait(1e-7)
            end
        end
    end)
    for _, v_u_1218 in pairs(v_u_1213:GetChildren()) do
        if v_u_1218.Name == "Wind1" and v_u_1218.Name == "Wind2" then
            if v_u_1218.Name == "main" then
                game:GetService("TweenService"):Create(v_u_1218, v_u_1214, {
                    ["CFrame"] = v_u_1218.CFrame * CFrame.Angles(0, 8.726646259971648, 0)
                }):Play()
            end
        else
            task.delay(0.3, function()
                -- upvalues: (copy) v_u_1218, (copy) v_u_1214
                local v1219 = game:GetService("TweenService")
                local v1220 = v_u_1218
                local v1221 = v_u_1214
                local v1222 = {}
                local v1223 = v_u_1218.Size.X
                local v1224 = v_u_1218.Size.Z
                v1222.Size = Vector3.new(v1223, 0, v1224)
                v1219:Create(v1220, v1221, v1222):Play()
            end)
        end
    end
end
local v_u_1226 = game.Lighting.blackImpact
local v_u_1227 = game.Lighting.whiteImpact
local function v1285(p_u_1228, p_u_1229, p_u_1230)
    -- upvalues: (copy) v_u_1226, (copy) v_u_1227, (copy) v_u_1018, (copy) v_u_1201, (copy) v_u_1210, (copy) v_u_1051, (copy) v_u_1100, (copy) v_u_1060, (copy) v_u_1038, (copy) v_u_35, (copy) v_u_1009, (copy) v_u_1030, (copy) v_u_71, (copy) v_u_107, (copy) v_u_205, (copy) v_u_255, (copy) v_u_260, (copy) v_u_273, (copy) v_u_282, (copy) v_u_289, (copy) v_u_16, (copy) v_u_292, (copy) v_u_1069, (copy) v_u_298, (copy) v_u_299, (copy) v_u_399, (copy) v_u_420, (copy) v_u_470, (ref) v_u_471, (copy) v_u_2, (copy) v_u_196, (copy) v_u_529, (copy) v_u_567, (copy) v_u_542, (copy) v_u_560, (copy) v_u_622, (copy) v_u_670, (copy) v_u_692, (copy) v_u_707, (copy) v_u_737, (copy) v_u_772, (copy) v_u_151, (copy) v_u_215, (copy) v_u_226, (copy) v_u_784, (copy) v_u_798, (copy) v_u_195, (copy) v_u_815, (copy) v_u_508, (copy) v_u_829, (copy) v_u_850, (copy) v_u_871, (copy) v_u_877, (copy) v_u_889, (copy) v_u_896, (copy) v_u_1023, (copy) v_u_903, (copy) v_u_932, (copy) v_u_980, (copy) v_u_934, (copy) v_u_1115, (copy) v_u_1130, (copy) v_u_1144, (copy) v_u_1148, (copy) v_u_1165, (copy) v_u_1181, (copy) v_u_1188, (copy) v_u_1196, (copy) v_u_1225
    pcall(function()
        -- upvalues: (copy) p_u_1228, (copy) p_u_1230, (ref) v_u_1226, (ref) v_u_1227, (ref) v_u_1018, (ref) v_u_1201, (ref) v_u_1210, (ref) v_u_1051, (copy) p_u_1229, (ref) v_u_1100, (ref) v_u_1060, (ref) v_u_1038, (ref) v_u_35, (ref) v_u_1009, (ref) v_u_1030, (ref) v_u_71, (ref) v_u_107, (ref) v_u_205, (ref) v_u_255, (ref) v_u_260, (ref) v_u_273, (ref) v_u_282, (ref) v_u_289, (ref) v_u_16, (ref) v_u_292, (ref) v_u_1069, (ref) v_u_298, (ref) v_u_299, (ref) v_u_399, (ref) v_u_420, (ref) v_u_470, (ref) v_u_471, (ref) v_u_2, (ref) v_u_196, (ref) v_u_529, (ref) v_u_567, (ref) v_u_542, (ref) v_u_560, (ref) v_u_622, (ref) v_u_670, (ref) v_u_692, (ref) v_u_707, (ref) v_u_737, (ref) v_u_772, (ref) v_u_151, (ref) v_u_215, (ref) v_u_226, (ref) v_u_784, (ref) v_u_798, (ref) v_u_195, (ref) v_u_815, (ref) v_u_508, (ref) v_u_829, (ref) v_u_850, (ref) v_u_871, (ref) v_u_877, (ref) v_u_889, (ref) v_u_896, (ref) v_u_1023, (ref) v_u_903, (ref) v_u_932, (ref) v_u_980, (ref) v_u_934, (ref) v_u_1115, (ref) v_u_1130, (ref) v_u_1144, (ref) v_u_1148, (ref) v_u_1165, (ref) v_u_1181, (ref) v_u_1188, (ref) v_u_1196, (ref) v_u_1225
        if p_u_1228 == "doImpactEffect" then
            local v1231 = p_u_1230[1]:FindFirstChild("whiteEffect")
            for v1232 = 1, 2 do
                if v1232 == 1 then
                    v_u_1226.Enabled = true
                    v1231.Enabled = true
                else
                    v_u_1227.Enabled = true
                    v_u_1226.Enabled = false
                    v1231.Enabled = false
                end
                task.wait(0.08)
                task.wait(0.001)
                v_u_1227.Enabled = false
            end
            return
        elseif p_u_1228 == "flowerslashes" then
            v_u_1018(p_u_1230[1])
            return
        elseif p_u_1228 == "windImpact" then
            v_u_1201(p_u_1230[1])
            return
        elseif p_u_1228 == "nezukoWind" then
            v_u_1210(p_u_1230[1], p_u_1230[2])
            return
        elseif p_u_1228 == "Orchid" then
            v_u_1051(p_u_1229)
            return
        elseif p_u_1228 == "kanaAir" then
            v_u_1100(p_u_1229)
            return
        elseif p_u_1228 == "camellia" then
            v_u_1060(p_u_1229)
            return
        elseif p_u_1228 == "InsectM1s" then
            v_u_1038(p_u_1229)
            return
        elseif p_u_1228 == "Slash" then
            v_u_35(p_u_1230[1], p_u_1230[2], p_u_1229)
            return
        elseif p_u_1228 == "doShinobuULT" then
            v_u_1009(p_u_1230[1])
            return
        elseif p_u_1228 == "crimsonslash" then
            v_u_1030(p_u_1229)
            return
        elseif p_u_1228 == "fireSlash" then
            v_u_71(p_u_1230[1], p_u_1229)
            return
        elseif p_u_1228 == "fireModeslash" then
            v_u_107(p_u_1230[1], p_u_1229)
            return
        elseif p_u_1228 == "waterSurf" then
            v_u_205(p_u_1229)
            return
        elseif p_u_1228 == "wheelSkill" then
            v_u_255(p_u_1229)
            return
        elseif p_u_1228 == "createRocks" then
            v_u_260(p_u_1229, p_u_1230[1], p_u_1230[2], p_u_1230[3])
            return
        elseif p_u_1228 == "flowingDance" then
            v_u_273()
            return
        elseif p_u_1228 == "createFlowingClones" then
            v_u_282(p_u_1229)
            return
        elseif p_u_1228 == "createCrater" then
            v_u_289(p_u_1229, p_u_1230[1], p_u_1230[2], p_u_1230[3], p_u_1230[4], p_u_1230[5], p_u_1230[6])
            return
        elseif p_u_1228 == "createFluxCrater" then
            v_u_16({
                ["Origin"] = p_u_1230[1],
                ["Radius"] = p_u_1230[2],
                ["Amount"] = p_u_1230[3],
                ["Size"] = p_u_1230[4],
                ["Lifetime"] = p_u_1230[5],
                ["Collision"] = p_u_1230[6]
            })
            return
        elseif p_u_1228 == "flowingTrail" then
            v_u_292(p_u_1229)
            return
        elseif p_u_1228 == "kanam1" then
            v_u_1069(p_u_1229)
            return
        elseif p_u_1228 == "whirlpool" then
            v_u_298(p_u_1229, p_u_1230[1])
            return
        elseif p_u_1228 == "drip" then
            v_u_299.Drip(p_u_1229, p_u_1230[1] + Vector3.new(0, 0, 5), p_u_1230[2])
            return
        elseif p_u_1228 == "splash" then
            v_u_299.Splash(p_u_1229, p_u_1230[1] + Vector3.new(0, 1.5, 0), math.random(15, 35), 7)
            return
        elseif p_u_1228 == "customSplash" then
            v_u_299.Splash(p_u_1229, p_u_1230[1], p_u_1230[2], p_u_1230[3])
            return
        elseif p_u_1228 == "bloodSplash" then
            v_u_299.bloodSplash(p_u_1229, p_u_1230[1], p_u_1230[2], p_u_1230[3], p_u_1230[4])
            return
        elseif p_u_1228 == "createModeSlash" then
            v_u_399(p_u_1230[1])
            return
        elseif p_u_1228 == "fluxExplode" then
            v_u_420(p_u_1230[1])
            return
        elseif p_u_1228 == "sendDragon" then
            v_u_470(p_u_1229, p_u_1230[1], p_u_1230[2])
            return
        elseif p_u_1228 == "dodgeTrail" then
            local v_u_1233 = p_u_1229
            local v_u_1234 = p_u_1230[1]
            task.spawn(function()
                -- upvalues: (copy) v_u_1233, (ref) v_u_471, (ref) v_u_2, (copy) v_u_1234, (ref) v_u_196
                local v_u_1235 = v_u_1233
                if not v_u_1235:FindFirstChild("Susanoo") then
                    v_u_1235 = v_u_1235.Character
                end
                local v_u_1236 = v_u_1235.HumanoidRootPart
                local v_u_1237 = script.dashSmoke:Clone()
                v_u_1237.Parent = workspace.GarbageCollection
                v_u_1237.CFrame = v_u_1236.CFrame * CFrame.new(0, -2, 0)
                v_u_1237.dirt1:Play()
                v_u_1237.dirt2:Play()
                task.spawn(function()
                    -- upvalues: (copy) v_u_1237
                    for _, v1238 in pairs(v_u_1237.Attachment:GetChildren()) do
                        v1238:Emit(5)
                    end
                end)
                if v_u_1235.Energy.Value > 0 then
                    v_u_471 = true
                    local v_u_1239 = Instance.new("Folder")
                    v_u_1239.Name = "Soru"
                    v_u_1239.Parent = v_u_1235
                    v_u_1235.Archivable = true
                    local v_u_1240 = v_u_1235:clone()
                    v_u_1240.Parent = game.Lighting
                    v_u_1235.Archivable = false
                    task.spawn(function()
                        -- upvalues: (copy) v_u_1236, (ref) v_u_1235, (ref) v_u_2
                        v_u_1236.SoruEmit.Enabled = true
                        for _, v1241 in pairs(v_u_1235.Head:GetChildren()) do
                            if v1241:IsA("Decal") then
                                v1241.Transparency = 1
                            end
                        end
                        for _, v_u_1242 in pairs(v_u_1235:GetDescendants()) do
                            if v_u_1242:IsA("BasePart") or (v_u_1242:IsA("Part") or v_u_1242:IsA("MeshPart")) then
                                local v1243 = v_u_2:Create(v_u_1242, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                    ["Transparency"] = 1
                                })
                                v1243:Play()
                                v1243:Destroy()
                            elseif v_u_1242:IsA("Accessory") then
                                local v1244 = v_u_2:Create(v_u_1242.Handle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                    ["Transparency"] = 1
                                })
                                v1244:Play()
                                v1244:Destroy()
                            elseif v_u_1242:IsA("Decal") then
                                v_u_1242.Transparency = 1
                            elseif v_u_1242:IsA("Tool") then
                                v_u_1242:Destroy()
                            end
                            task.spawn(function()
                                -- upvalues: (ref) v_u_1235, (copy) v_u_1242
                                if not v_u_1235:FindFirstChild("IFrame") then
                                    if v_u_1242:IsA("Sound") then
                                        v_u_1242:Stop()
                                        return
                                    end
                                    if v_u_1242:IsA("ParticleEmitter") and v_u_1242.Name ~= "SoruEmit" then
                                        v_u_1242.Enabled = false
                                        return
                                    end
                                    if v_u_1242:IsA("Beam") then
                                        v_u_1242.Enabled = false
                                        return
                                    end
                                    if v_u_1242:IsA("PointLight") then
                                        v_u_1242.Enabled = false
                                        return
                                    end
                                    if v_u_1242:IsA("Trail") then
                                        v_u_1242.Enabled = false
                                        if v_u_1242.Name == "normalTrail" then
                                            task.delay(1, function()
                                                -- upvalues: (ref) v_u_1242
                                                v_u_1242.Enabled = true
                                            end)
                                        end
                                    end
                                end
                            end)
                        end
                        task.spawn(function()
                            -- upvalues: (ref) v_u_1236
                            task.wait(0.3)
                            v_u_1236.SoruEmit.Enabled = false
                        end)
                        task.wait(1)
                        while task.wait() and v_u_1235:FindFirstChild("dashingSpeed") do

                        end
                        for _, v1245 in pairs(v_u_1235:GetDescendants()) do
                            if v1245.Name ~= "HumanoidRootPart" then
                                if v1245:IsA("BasePart") or (v1245:IsA("Part") or v1245:IsA("MeshPart")) then
                                    if v1245.Parent:FindFirstChild("bladeAttach") then
                                        local v1246 = v_u_2:Create(v1245.Parent.Base, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                            ["Transparency"] = 0
                                        })
                                        v1246:Play()
                                        v1246:Destroy()
                                        v1245.Parent.Blade.Transparency = 1
                                        v1245.Parent.Handle.Transparency = 1
                                    else
                                        local v1247 = v_u_2:Create(v1245, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                            ["Transparency"] = 0
                                        })
                                        v1247:Play()
                                        v1247:Destroy()
                                    end
                                elseif v1245:IsA("Accessory") then
                                    local v1248 = v_u_2:Create(v1245.Handle, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                        ["Transparency"] = 0
                                    })
                                    v1248:Play()
                                    v1248:Destroy()
                                elseif v1245:IsA("Decal") then
                                    v1245.Transparency = 0
                                elseif v1245:IsA("PointLight") then
                                    v1245.Enabled = true
                                end
                            end
                        end
                        for _, v1249 in pairs(v_u_1235.Head:GetChildren()) do
                            if v1249:IsA("Decal") then
                                v1249.Transparency = 0
                            end
                        end
                    end)
                    v_u_1236.Parent.Archivable = true
                    local v_u_1250 = v_u_1240:clone()
                    v_u_1250.Parent = workspace.GarbageCollection
                    local v1251 = v_u_1250.HumanoidRootPart
                    local v1252 = v_u_1236.CFrame * CFrame.new(0, math.random(2, 4), 0)
                    local v1253 = CFrame.Angles
                    local v1254 = math.random(90, 360)
                    local v1255 = math.rad(v1254)
                    local v1256 = math.random(90, 360)
                    local v1257 = math.rad(v1256)
                    local v1258 = math.random(90, 360)
                    v1251.CFrame = v1252 * v1253(v1255, v1257, (math.rad(v1258)))
                    local v1259 = v_u_1250.HumanoidRootPart
                    v1259.CFrame = v1259.CFrame * CFrame.new(math.random(4, 4), 0, math.random(4, 4))
                    v_u_1250.Humanoid:Destroy()
                    if v_u_1250:FindFirstChild("FakeHead") then
                        if v_u_1250.FakeHead:FindFirstChild("face") then
                            v_u_1250.FakeHead.face:Destroy()
                        end
                    elseif v_u_1250.Head:FindFirstChild("face") then
                        v_u_1250.Head.face:Destroy()
                    end
                    game.Debris:AddItem(v_u_1250, 1.8)
                    if v_u_1250.Head:FindFirstChild("Dodges") then
                        v_u_1250.Head:FindFirstChild("Dodges"):Destroy()
                    end
                    v_u_1235.Archivable = false
                    task.spawn(function()
                        -- upvalues: (copy) v_u_1250, (ref) v_u_2, (ref) v_u_1235
                        for _, v_u_1260 in pairs(v_u_1250:GetDescendants()) do
                            if v_u_1260:IsA("BasePart") or (v_u_1260:IsA("Part") or v_u_1260:IsA("MeshPart")) then
                                v_u_1260.Color = Color3.new(0.152941, 0.152941, 0.152941)
                                v_u_1260.Anchored = true
                                v_u_1260.CanCollide = false
                                v_u_1260.Material = Enum.Material.Neon
                                local v1261 = v_u_2:Create(v_u_1260, TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                    ["Transparency"] = 1,
                                    ["Color"] = Color3.new(1, 1, 1)
                                })
                                v1261:Play()
                                v1261:Destroy()
                            elseif v_u_1260:IsA("Tool") then
                                v_u_1260:Destroy()
                            elseif v_u_1260:IsA("Accessory") then
                                local v1262
                                if v_u_1260.Handle:FindFirstChild("Mesh") then
                                    v1262 = v_u_1260.Handle:FindFirstChild("Mesh")
                                    v1262.TextureId = ""
                                    v1262.VertexColor = Vector3.new(0.152941, 0.152941, 0.152941)
                                elseif v_u_1260.Handle:FindFirstChild("SpecialMesh") then
                                    v1262 = v_u_1260.Handle:FindFirstChild("SpecialMesh")
                                    v1262.TextureId = ""
                                    v1262.VertexColor = Vector3.new(0.152941, 0.152941, 0.152941)
                                else
                                    v1262 = v_u_1260.Handle
                                    v1262.TextureID = ""
                                    v1262.Color = Color3.new(0.152941, 0.152941, 0.152941)
                                end
                                v_u_1260.Handle.Material = Enum.Material.Neon
                                local v1263 = v_u_2:Create(v_u_1260.Handle, TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                    ["Transparency"] = 1
                                })
                                v1263:Play()
                                v1263:Destroy()
                                if v1262.Parent:FindFirstChild("Mesh") or v1262.Parent:FindFirstChild("SpecialMesh") then
                                    local v1264 = v_u_2:Create(v1262, TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                        ["VertexColor"] = Vector3.new(1, 1, 1)
                                    })
                                    v1264:Play()
                                    v1264:Destroy()
                                else
                                    local v1265 = v_u_2:Create(v1262, TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                        ["Color"] = Color3.new(1, 1, 1)
                                    })
                                    v1265:Play()
                                    v1265:Destroy()
                                end
                            elseif v_u_1260:IsA("Decal") then
                                v_u_1260.Transparency = 1
                            elseif v_u_1250:FindFirstChild("Susanoo") and v_u_1260:IsA("Weld") then
                                v_u_1260:Destroy()
                            end
                            task.spawn(function()
                                -- upvalues: (ref) v_u_1235, (copy) v_u_1260
                                if not v_u_1235:FindFirstChild("IFrame") then
                                    if v_u_1260:IsA("Sound") then
                                        v_u_1260:Stop()
                                        return
                                    end
                                    if v_u_1260:IsA("ParticleEmitter") then
                                        v_u_1260.Enabled = false
                                        task.delay(1.5, function()
                                            -- upvalues: (ref) v_u_1260
                                            if v_u_1260.Name == "Insects" or v_u_1260.Name == "Insects2" then
                                                v_u_1260.Enabled = true
                                            end
                                        end)
                                        return
                                    end
                                    if v_u_1260:IsA("Trail") then
                                        v_u_1260.Enabled = false
                                        if v_u_1260.Name == "normalTrail" then
                                            task.delay(1, function()
                                                -- upvalues: (ref) v_u_1260
                                                v_u_1260.Enabled = true
                                            end)
                                            return
                                        end
                                    else
                                        if v_u_1260:IsA("Beam") then
                                            v_u_1260.Enabled = false
                                            return
                                        end
                                        if v_u_1260:IsA("PointLight") then
                                            v_u_1260.Enabled = false
                                        end
                                    end
                                end
                            end)
                        end
                    end)
                    task.wait(0.04)
                    task.delay(0.5, function()
                        -- upvalues: (copy) v_u_1239, (copy) v_u_1240
                        v_u_1239:Destroy()
                        v_u_1240:Destroy()
                    end)
                    task.wait(1.5)
                    v_u_471 = false
                elseif v_u_1234 == Enum.KeyCode.W and v_u_471 == true then
                    local v1266 = script.Burst_1.Attachment:Clone()
                    v1266.Parent = v_u_1236
                    local v1267 = script.Burst_1.Speedline:Clone()
                    v1267.Parent = v_u_1236
                    for _, v_u_1268 in pairs(v1266:GetChildren()) do
                        v_u_1268:Emit(1)
                        task.delay(0.23, function()
                            -- upvalues: (copy) v_u_1268
                            v_u_1268.LockedToPart = false
                        end)
                    end
                    for _, v1269 in pairs(v1267:GetChildren()) do
                        v1269:Emit(20)
                    end
                    game.Debris:AddItem(v1266, 2)
                    game.Debris:AddItem(v1267, 2)
                end
                game.Debris:AddItem(v_u_1237, 2)
                while v_u_1235:FindFirstChild("Stunned") do
                    local v1270
                    if v_u_1234 == Enum.KeyCode.A or v_u_1234 == Enum.KeyCode.D then
                        v1270 = CFrame.new(0, 0, math.random(2, 5))
                    else
                        v1270 = CFrame.new(0, 0, 3)
                    end
                    v_u_196({
                        ["StartPos"] = v_u_1236.CFrame * v1270,
                        ["Offset"] = math.random(-2, 2),
                        ["Amount"] = 1,
                        ["Size"] = Vector3.new(0.5, 0.5, 0.5),
                        ["Filter"] = { workspace.GarbageCollection, workspace.Live },
                        ["IterationDelay"] = 0,
                        ["Duration"] = 1.23
                    })
                    task.wait(0.1)
                end
            end)
            return
        elseif p_u_1228 == "Rsun" then
            v_u_529(p_u_1229)
            return
        elseif p_u_1228 == "pushBack" then
            v_u_567(p_u_1229)
            return
        elseif p_u_1228 == "AkazaAir" then
            v_u_542(p_u_1229)
            return
        elseif p_u_1228 == "akazaSlash" then
            v_u_560(p_u_1229)
            return
        elseif p_u_1228 == "disorder" then
            v_u_622(p_u_1229, p_u_1230[1], p_u_1230[2])
            return
        elseif p_u_1228 == "sendAirType" then
            v_u_670(p_u_1229, p_u_1230[1], p_u_1230[2])
            return
        elseif p_u_1228 == "explosiveFurry" then
            v_u_692(p_u_1229)
            return
        elseif p_u_1228 == "punishAkaza" then
            v_u_707(p_u_1229, p_u_1230[1])
            return
        elseif p_u_1228 == "uptilt" then
            v_u_737(p_u_1229)
            return
        elseif p_u_1228 == "projectImpact" then
            v_u_772(p_u_1229)
            return
        elseif p_u_1228 == "KokuSlash" then
            v_u_151(p_u_1230, p_u_1229)
            return
        elseif p_u_1228 == "moonSurf" then
            v_u_215(p_u_1229, p_u_1230)
            return
        elseif p_u_1228 == "moonModeSurf" then
            v_u_226(p_u_1229, p_u_1230)
            return
        elseif p_u_1228 == "moonBarrage" then
            v_u_784(p_u_1229)
            return
        elseif p_u_1228 == "Debree2" then
            v_u_798(p_u_1229, p_u_1230[1], p_u_1230[2], p_u_1230[3], p_u_1230[4], p_u_1230[5])
            return
        elseif p_u_1228 == "KokuModeSlash" then
            v_u_195(p_u_1230, p_u_1229)
            return
        elseif p_u_1228 == "moonPhoenix" then
            v_u_815(p_u_1229)
            return
        elseif p_u_1228 == "evade" then
            v_u_508(p_u_1229)
            return
        elseif p_u_1228 == "armChop" then
            v_u_829(p_u_1229)
            return
        elseif p_u_1228 == "insectAir" then
            v_u_850(p_u_1229)
            return
        elseif p_u_1228 == "insectThrust" then
            v_u_871(p_u_1229)
            return
        elseif p_u_1228 == "burnEffect" then
            local v_u_1271 = p_u_1229
            task.spawn(function()
                -- upvalues: (copy) v_u_1271
                task.spawn(function()
                    -- upvalues: (ref) v_u_1271
                    for _, v_u_1272 in pairs(v_u_1271:GetChildren()) do
                        local v_u_1273 = script.burnEffect
                        task.spawn(function()
                            -- upvalues: (copy) v_u_1273, (copy) v_u_1272
                            for _, v1274 in pairs(v_u_1273:GetChildren()) do
                                local v1275 = v1274:Clone()
                                v1275.Parent = v_u_1272
                                game.Debris:AddItem(v1275, 2)
                                task.wait(0.1)
                            end
                        end)
                    end
                end)
                for _, v_u_1276 in pairs(v_u_1271:GetDescendants()) do
                    if v_u_1276:IsA("BasePart") or (v_u_1276:IsA("Part") or v_u_1276:IsA("MeshPart")) then
                        v_u_1276.Material = "Slate"
                        v_u_1276.Color = Color3.new(0.0705882, 0.0705882, 0.0705882)
                    elseif v_u_1276:IsA("Accessory") then
                        v_u_1276.Material = "Slate"
                        v_u_1276.Color = Color3.new(0.0705882, 0.0705882, 0.0705882)
                    end
                    if not v_u_1271:FindFirstChild("IFrame") then
                        if v_u_1276:IsA("Sound") then
                            v_u_1276:Stop()
                        elseif v_u_1276:IsA("ParticleEmitter") then
                            v_u_1276.Enabled = false
                            task.delay(1, function()
                                -- upvalues: (copy) v_u_1276
                                if v_u_1276.Name == "Insects" or v_u_1276.Name == "Insects2" then
                                    v_u_1276.Enabled = true
                                end
                            end)
                        elseif v_u_1276:IsA("Trail") then
                            v_u_1276.Enabled = false
                            if v_u_1276.Name == "normalTrail" then
                                task.delay(1, function()
                                    -- upvalues: (copy) v_u_1276
                                    v_u_1276.Enabled = true
                                end)
                            end
                        elseif v_u_1276:IsA("Beam") then
                            v_u_1276.Enabled = false
                        elseif v_u_1276.Name == "Blade" and v_u_1276.Parent:FindFirstChild("normalTrail") then
                            v_u_1276.Parent.normalTrail.Enabled = false
                            task.delay(1, function()
                                -- upvalues: (copy) v_u_1276
                                v_u_1276.Parent.normalTrail.Enabled = true
                            end)
                        end
                    end
                    task.wait()
                end
            end)
            return
        elseif p_u_1228 == "graveStone" then
            v_u_877(p_u_1229)
            return
        elseif p_u_1228 == "coins" then
            v_u_889(p_u_1229)
            return
        elseif p_u_1228 == "fish" then
            v_u_896(p_u_1229)
            return
        elseif p_u_1228 == "demonDust" then
            local v_u_1277 = p_u_1229
            if not v_u_1277:IsA("Model") then
                v_u_1277 = v_u_1277.Character
            end
            local _ = v_u_1277.HumanoidRootPart
            task.spawn(function()
                -- upvalues: (ref) v_u_1277, (ref) v_u_2
                task.spawn(function()
                    -- upvalues: (ref) v_u_1277
                    for _, v_u_1278 in pairs(v_u_1277:GetChildren()) do
                        local v_u_1279 = script.dustEffect
                        task.spawn(function()
                            -- upvalues: (copy) v_u_1279, (copy) v_u_1278
                            for _, v1280 in pairs(v_u_1279:GetChildren()) do
                                local v_u_1281 = v1280:Clone()
                                v_u_1281.Parent = v_u_1278
                                game.Debris:AddItem(v_u_1281, 2)
                                task.wait(0.1)
                                task.delay(0.5, function()
                                    -- upvalues: (copy) v_u_1281
                                    v_u_1281.Enabled = false
                                end)
                            end
                        end)
                    end
                end)
                for _, v_u_1282 in pairs(v_u_1277:GetDescendants()) do
                    if v_u_1282:IsA("BasePart") or (v_u_1282:IsA("Part") or v_u_1282:IsA("MeshPart")) then
                        v_u_1282.Material = "Slate"
                        v_u_1282.Color = Color3.new(0.239216, 0.0784314, 0.0784314)
                        task.delay(0.3, function()
                            -- upvalues: (ref) v_u_2, (copy) v_u_1282
                            local v1283 = v_u_2:Create(v_u_1282, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                ["Transparency"] = 1
                            })
                            v1283:Play()
                            v1283:Destroy()
                        end)
                    elseif v_u_1282:IsA("Accessory") then
                        v_u_1282.Material = "Slate"
                        v_u_1282.Color = Color3.new(0.239216, 0.0784314, 0.0784314)
                        task.delay(0.3, function()
                            -- upvalues: (ref) v_u_2, (copy) v_u_1282
                            local v1284 = v_u_2:Create(v_u_1282.Handle, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                ["Transparency"] = 1
                            })
                            v1284:Play()
                            v1284:Destroy()
                        end)
                    end
                    if not v_u_1277:FindFirstChild("IFrame") then
                        if v_u_1282:IsA("Sound") then
                            v_u_1282:Stop()
                        elseif v_u_1282:IsA("ParticleEmitter") then
                            if v_u_1282.Name ~= "SoruEmit" then
                                v_u_1282.Enabled = false
                            end
                            task.delay(1, function()
                                -- upvalues: (copy) v_u_1282
                                if v_u_1282.Name == "Insects" or v_u_1282.Name == "Insects2" then
                                    v_u_1282.Enabled = true
                                end
                            end)
                        elseif v_u_1282:IsA("Trail") then
                            v_u_1282.Enabled = false
                            if v_u_1282.Name == "normalTrail" then
                                task.delay(1, function()
                                    -- upvalues: (copy) v_u_1282
                                    v_u_1282.Enabled = true
                                end)
                            end
                        elseif v_u_1282:IsA("Beam") then
                            v_u_1282.Enabled = false
                        elseif v_u_1282.Name == "Blade" and v_u_1282.Parent:FindFirstChild("normalTrail") then
                            v_u_1282.Parent.normalTrail.Enabled = false
                            task.delay(1, function()
                                -- upvalues: (copy) v_u_1282
                                v_u_1282.Parent.normalTrail.Enabled = true
                            end)
                        end
                    end
                    task.wait()
                end
            end)
            return
        elseif p_u_1228 == "EXPLODEEE" then
            v_u_1023(p_u_1229)
            return
        elseif p_u_1228 == "insectBarrage" then
            v_u_903(p_u_1229)
            return
        elseif p_u_1228 == "fireuptilt" then
            v_u_932(p_u_1229)
            return
        elseif p_u_1228 == "insectSting" then
            v_u_980(p_u_1229)
            return
        elseif p_u_1228 == "createFireRocks" then
            v_u_934(p_u_1229, p_u_1230[1])
            return
        elseif p_u_1228 == "barrenGarden" then
            v_u_1115(p_u_1229)
            return
        elseif p_u_1228 == "Freeze" then
            v_u_1130(p_u_1230[1], p_u_1230[2])
            return
        elseif p_u_1228 == "icePlr" then
            v_u_1144(p_u_1230[1], p_u_1230[2])
            return
        elseif p_u_1228 == "gunshot" then
            v_u_1148(p_u_1230[1], p_u_1230[2])
            return
        elseif p_u_1228 == "experimentalCharge" then
            v_u_1165(p_u_1229)
            return
        elseif p_u_1228 == "experimentalCharge2" then
            v_u_1181(p_u_1229)
            return
        elseif p_u_1228 == "whirlwindCutter" then
            v_u_1188(p_u_1230[1], p_u_1230[2])
            return
        elseif p_u_1228 == "nezukoPart" then
            return
        elseif p_u_1228 == "clawsWind" then
            v_u_1196(p_u_1230[1])
        elseif p_u_1228 == "windCyclone" then
            v_u_1225(p_u_1230[1])
        end
    end)
end
game.ReplicatedStorage.Remotes.ClientEffects.OnClientEvent:Connect(v1285)
