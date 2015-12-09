-- Load Extensions
local tiling = require "hs.tiling"
local mash = {"shift", "cmd", "alt", "ctrl"}

hs.hotkey.bind(mash, "c", function() tiling.cyclelayout() end)
hs.hotkey.bind(mash, "j", function() tiling.cycle(1) end)
hs.hotkey.bind(mash, "k", function() tiling.cycle(-1) end)
hs.hotkey.bind(mash, "space", function() tiling.promote() end)
hs.hotkey.bind(mash, "r", function() tiling.retile() end)

-- If you want to set the layouts that are enabled
tiling.set('layouts', {
  'main-vertical', 'fullscreen' 
})

-- Push the window into the exact center of the screen
local function center(window)
  frame = window:screen():frame()
  frame.x = (frame.w / 2) - (frame.w / 4)
  frame.y = (frame.h / 2) - (frame.h / 4)
  frame.w = frame.w / 2
  frame.h = frame.h / 2
  window:setframe(frame)
end

hs.hotkey.bind(mash, "f", function() tiling.togglefloat(center) end)

--[[
local caffeine = hs.menubar.new()

function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("AWAKE")
--				caffeine:setIcon(os.getenv("HOME") .. "/.hammerspoon/coffee_on.eps")
    else
        caffeine:setTitle("SLEEPY")
--				caffeine:setIcon(os.getenv("HOME") .. "/.hammerspoon/coffee_off.eps")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end
]]--


local mouseCircle = nil
local mouseCircleTimer = nil

function mouseHighlight()
    -- Delete an existing highlight if it exists
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    -- Get the current co-ordinates of the mouse pointer
    mousepoint = hs.mouse.get()
    -- Prepare a big red circle around the mouse pointer
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
    mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:show()

    -- Set a timer to delete the circle after 3 seconds
    mouseCircleTimer = hs.timer.doAfter(1, function() mouseCircle:delete() end)
end
--hs.hotkey.bind({"cmd","alt","shift"}, "D", mouseHighlight)
hs.hotkey.bind(mash, "d", function() mouseHighlight() end)


function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send():release()

--hs.alert.show("Config loaded")