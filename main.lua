function love.load()
    wf = require "libraries/windfield"

    world = wf.newWorld(0, 500)

    player = world:newRectangleCollider(350, 100, 80, 80)
    ground = world:newRectangleCollider(100, 400, 600, 100)
    ground:setType("static")
end

function love.update(dt)
    local px, py = player:getLinearVelocity()
    if love.keyboard.isDown('a') and px > -300 then -- a key, is setup for the player to move left
        player:applyForce(-8000, 0)
    elseif love.keyboard.isDown('d')  and px < 300 then -- d key, is setup for the player to move right
        player:applyForce(8000, 0)
    end
    world:update(dt)
end

function love.draw()
    world:draw()
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

    if key == 'w' then -- w key, is setup for the player to jump
        player:applyLinearImpulse(0, -5000)
    end
end


