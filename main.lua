--- created on 08/01/2017 by Runner
--

local qc = require('QuickCaster')

local game
local player1, player2
a = 1

function love.load()
    game = qc.Game.new()
    player1 = qc.Player:new(4, {'up','down','left','right','a','b','x','y','l','r'})
    player1:renew()

    player2 = qc.Player:new(4, {'q','s','d','f','g'})
    player2:renew()

    print('player1.validinputs: ', player1.validinputs[1], '\n')

    math.randomseed(os.time())
    --x, y, w, h = 20, 20, 60, 20

--    joysticks = love.joystick.getJoysticks()
--    io.write('joysticks: ', #joysticks, '\n')
--    for k, v in pairs(joysticks) do
--      io.write(v, "\n")
--    end
end

-- Increase the size of the rectangle every frame.
function love.update(dt)

end

-- Draw a coloured rectangle.
function love.draw()
    if a==1 then print('player1.stack: ', player1.stack[1], '\n'); a = a+1 end

    love.graphics.setColor(0, 100, 100)
    --love.graphics.rectangle("fill", x, y, w, h)

    -- PlayerOne ----------------------------------------
    -- buttons --
    love.graphics.setColor(0, 100, 100)
    for i=1, player1.chainsize, 1 do
        if i > player1.completion
        then
            love.graphics.setColor(100, 0, 0)
        end
        love.graphics.print(player1.stack[i], i*50, 100)
    end

    -- Score

    -- PlayerTwo ----------------------------------------
    love.graphics.setColor(0, 100, 100)
    for i=1, player2.chainsize, 1 do
        if i > player2.completion
        then
            love.graphics.setColor(100, 0, 0)
        end
        love.graphics.print(player2.stack[i], 500+i*50, 100)
    end
    -- Score

end

function love.keypressed(key)

    player1:successcheck(key)

--    if key == stack[completion+1] then
--        completion = completion+1
--    else
--        completion = 0
--    end
--
    if key == 'escape' then love.event.quit() end
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

function randominput()
    return validinputs[math.random(1, #validinputs)]
end