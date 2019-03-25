gsap = require 'gsap'
Radio = require 'nanoevents'

class BlockItemView extends PIXI.Graphics

    interactive: true
    buttonMode: true
    clicked: false
    alreadyClick: false
    radio: new Radio()

    constructor: (model, container) ->
        super()
        @type = model.type
        @model = model
        @originX = model.x
        @originY = model.y
        @container = container
        @build()
        @on 'click', @onClick

        
    onClick:=>
        @clicked = true
        @radio.emit("send:message","hola")
        #console.log @type
        @animate()
        
    build:=>
        if @model.type == 'soft'
            color = '0xffffff'
            @destinyX = 100
            @destinyY = 100
        else
            color = '0x5090ff'
            @destinyX = 100
            @destinyY = 400
      
        @beginFill(color)
        @drawRect(0,0, @model.width, @model.height)
        @endFill()
        @x = @model.x
        @y = @model.y
        
        @container.addChild(@)
    animate:=>
        gsap.TweenMax.to @, 0.5,
        x: @destinyX
        y: @destinyY

module.exports = BlockItemView