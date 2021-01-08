--[[
    Cards

    A Class to represent a card with it's image and ID information.
]]

 Card = Class {}

 function Card:init(cardType, x, y)
    self.cardType = cardType
    self.x = x
    self.y = y
    --card was found, waiting a pair
    self.visible = false
    --card was found in a pair
    self.reveal = false
 end

 function Card:update(dt)
    local mouseX, mouseY = love.mouse.getPosition()
    if love.mouse.isDown(1) then
        if mouseX >= self.x and mouseX <= (self.x + CARD_WIDTH) 
        and mouseY >= self.y and mouseY <= (self.y + CARD_HEIGHT) then    
            if not self.visible and not self.reveal then
                self.visible = true
            end
        end

    end
 end

 function Card:render()
    love.graphics.setColor(0.2, 0.2, 0.2, 1)
    love.graphics.rectangle('fill', self.x, self.y, CARD_WIDTH, CARD_HEIGHT, 3)

    if self.visible or self.reveal then
        love.graphics.setFont(SMALL)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(gTextures[self.cardType], self.x + X_OFFSET, self.y + Y_OFFSET, 0, 0.5, 0.5)

        love.graphics.print(self.cardType, self.x + TEXT_X, self.y + TEXT_Y, 0)
    end
 end