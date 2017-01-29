--- created on 12/01/2017 by Runner
--

local QuickCaster = {}

--- the main game object which is used a a reference of what is allowed
--
QuickCaster.Game = {}

function QuickCaster.Game:new()
    setmetatable({}, Game)

    return self
end

--- the player object is used, as there will usually be two players
--
QuickCaster.Player = { validinputs = {}, stack = {}, completion = 0, score = 0 }

function QuickCaster.Player:new( chainsize , validinputs )
    setmetatable({}, Player)
    self.validinputs = validinputs
    self.chainsize = chainsize
    self.stack = {}
    self.completion = 0
    self.score = 0
    --self.game = game

    return self
end

--- the renew() function rerolls a stack of commands for the player.
-- since there
function QuickCaster.Player:renew()
    local vi = self.validinputs

    for i = 1, self.chainsize, 1
    do
        self.stack[i] = vi[math.random(1, #vi)]
    end
    self.completion = 0
end

--- the successcheck() function takes an input and processes it
-- results in either the command being correct and points being awarded
-- or a renew() of the player's stack
function QuickCaster.Player:successcheck(input)
    if self:validcommand(input)
     then
        if input == self.stack[self.completion+1]
        then
            self.completion = self.completion+1
        else
            self:renew()
        end
        if self.completion == #self.stack
        then
            self.score = self.score+1
            self:renew()
        end
    end
end

--- the validcommand() function checks that an input is indeed in the set of
-- possible commands. it avoids presses on weird buttons resulting in a stack reset
function QuickCaster.Player:validcommand(input)
    for _, v in pairs(self.validinputs) do
        if v == input
        then
            return true
        end
    end
    return false
end

return QuickCaster -- module end