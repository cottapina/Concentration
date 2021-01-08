--[[
    Dependencies

    Stores references to all loaded resources and source codes
    dependencies (libraries).
]]

Class = require 'class'
require 'Card'
require 'constants'

gTextures = {
    ['bear'] = love.graphics.newImage('assets/animals/bear.png'),
    ['buffalo'] = love.graphics.newImage('assets/animals/buffalo.png'),
    ['chick'] = love.graphics.newImage('assets/animals/chick.png'),
    ['chicken'] = love.graphics.newImage('assets/animals/chicken.png'),
    ['cow'] = love.graphics.newImage('assets/animals/cow.png'),
    ['crocodile'] = love.graphics.newImage('assets/animals/crocodile.png'),
    ['dog'] = love.graphics.newImage('assets/animals/dog.png'),
    ['duck'] = love.graphics.newImage('assets/animals/duck.png'),
    ['elephant'] = love.graphics.newImage('assets/animals/elephant.png'),
    ['frog'] = love.graphics.newImage('assets/animals/frog.png'),
    ['giraffe'] = love.graphics.newImage('assets/animals/giraffe.png'),
    ['goat'] = love.graphics.newImage('assets/animals/goat.png'),
    ['gorilla'] = love.graphics.newImage('assets/animals/gorilla.png'),
    ['hippo'] = love.graphics.newImage('assets/animals/hippo.png'),
    ['horse'] = love.graphics.newImage('assets/animals/horse.png'),
    ['monkey'] = love.graphics.newImage('assets/animals/monkey.png'),
    ['moose'] = love.graphics.newImage('assets/animals/moose.png'),
    ['narwhal'] = love.graphics.newImage('assets/animals/narwhal.png'),
    ['owl'] = love.graphics.newImage('assets/animals/owl.png'),
    ['panda'] = love.graphics.newImage('assets/animals/panda.png'),
    ['parrot'] = love.graphics.newImage('assets/animals/parrot.png'),
    ['penguin'] = love.graphics.newImage('assets/animals/penguin.png'),
    ['pig'] = love.graphics.newImage('assets/animals/pig.png'),
    ['rabbit'] = love.graphics.newImage('assets/animals/rabbit.png'),
    ['rhino'] = love.graphics.newImage('assets/animals/rhino.png'),
    ['sloth'] = love.graphics.newImage('assets/animals/sloth.png'),
    ['snake'] = love.graphics.newImage('assets/animals/snake.png'),
    ['walrus'] = love.graphics.newImage('assets/animals/walrus.png'),
    ['whale'] = love.graphics.newImage('assets/animals/whale.png'),
    ['zebra'] = love.graphics.newImage('assets/animals/zebra.png')
}