--[[
    Concentration Game!
    Author: Gabriel Pina

    The classic memory card game built in lua. The goal is to match pairs of face-down cards.
]]

require 'dependencies'

local selectTimer = 0
local readytoSelect = true

local firstCard, secondCard
local cardsFlipped = {}

local gameOver = false

function love.load()
    love.window.setTitle("Concentration")
    math.randomseed(os.time())
    love._openConsole()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false
    }
    )
    instanciateCards()
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

end


function love.update(dt)

    if gameOver then
        return
    end

    cardsFlipped = {}

    if readytoSelect then
        --allow us to click in a card to find a pair
        for y = 1, CARD_TALL do
            for x = 1, CARD_WIDE do
                gCards[y][x]:update(dt)
            end
        end


        for y = 1, CARD_TALL do
            for x = 1, CARD_WIDE do
                if gCards[y][x].visible then
                    table.insert(cardsFlipped, {x = x, y = y})
                end
            end
        end
        --check all cards flipped and turn the not visible
        if #cardsFlipped == 2 then
            readytoSelect = false
            firstCard, secondCard = cardsFlipped[1], cardsFlipped[2]
            local card1, card2 = gCards[firstCard.y][firstCard.x], gCards[secondCard.y][secondCard.x]
            if card1.cardType == card2.cardType then
                gCards[firstCard.y][firstCard.x].reveal = true
                gCards[secondCard.y][secondCard.x].reveal = true
            end

            local allReveal = true
            for y = 1, CARD_TALL do
                for x = 1, CARD_WIDE do
                    if not gCards[y][x].reveal then
                        allReveal = false
                    end
                end
            end

            if allReveal then
                gameOver = true --quit
            end
        end
    else
        
        selectTimer = selectTimer + dt
        
        if selectTimer > 1 then
            selectTimer = 0
            readytoSelect = 'true'

            gCards[firstCard.y][firstCard.x].visible = false
            gCards[secondCard.y][secondCard.x].visible = false
            cardsFlipped = {}
        end
    end
end

function love.draw()
    for y = 1, CARD_TALL do 
        for x = 1, CARD_WIDE do
            gCards[y][x]:render()
        end
    end

    if gameOver then
        love.graphics.setFont(HUGE)
        love.graphics.printf('You Win!', 0, WINDOW_HEIGHT / 2 - 64, WINDOW_WIDTH, 'center')
    end
end

function instanciateCards()
    gCards = {}

    local animalMap = {}
    local numAnimals = (CARD_TALL * CARD_WIDE) / 2
    local animalKeys = {}

    -- get a unique animal for every pair of animals
    for i = 1, numAnimals do
        local animalStr

        repeat
            animalStr = ANIMALS[math.random(#ANIMALS)]
        until not animalMap[animalStr]

        animalMap[animalStr] = 2
        table.insert(animalKeys, animalStr)
    end

    local marginX = WINDOW_WIDTH - (CARD_WIDTH * CARD_WIDE + CARD_PADDING)
    local marginY = WINDOW_HEIGHT - (CARD_HEIGHT * CARD_TALL + CARD_PADDING)

    for y = 1, CARD_TALL do 
        table.insert(gCards, {})
        
        for x = 1, CARD_WIDE do
            --generating a random animal
            local randomIndex = math.random(#animalKeys)
            local randomAnimal = animalKeys[randomIndex]
            

            table.insert(gCards[y], Card(randomAnimal,
            (marginX / 2) + (x - 1) * (CARD_WIDTH + CARD_PADDING),
            (marginY / 2) + (y - 1) * (CARD_HEIGHT + CARD_PADDING)))

            animalMap[randomAnimal] = animalMap[randomAnimal] - 1

            --remove the animal from the keyset
            if animalMap[randomAnimal] ==  0 then
                table.remove(animalKeys, randomIndex)
                animalMap[randomAnimal] = nil     
            end
        end
    end

end