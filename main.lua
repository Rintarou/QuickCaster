--[[ created on 08/01/2017 by Runner
 ]]

-- Load some default values for our rectangle.
function love.load()
    x, y, w, h = 20, 20, 60, 20
    joysticks = love.joystick.getJoysticks()
    io.write('joysticks: ', #joysticks, '\n')
    for k, v in pairs(joysticks) do
      io.write(v, "\n")
    end
end

-- Increase the size of the rectangle every frame.
function love.update(dt)

end

-- Draw a coloured rectangle.
function love.draw()
    love.graphics.setColor(0, 100, 100)
    love.graphics.rectangle("fill", x, y, w, h)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

    if key == "up" then
        y = y-1
    elseif key == "down" then
        y = y+1
    end

    if key == "left" then
        x = x-1

    elseif key == "right" then
        x = x+1
    end
end

--function love.joystickpressed(joystick,button)
--    if joy:isGamepadDown('a') then
--        y = y+1
--    end
--end

function love.joystickadded(joystick)
    joy = joystick
    io.write('ok')
end