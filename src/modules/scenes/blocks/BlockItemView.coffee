gsap = require 'gsap'
Radio = require 'nanoevents'
$ = require("jquery")


class BlockItemView extends PIXI.Graphics

    interactive: true
    buttonMode: true
    clicked: false
    hovered: false
    alreadyClick: false
    radio: new Radio()
    
    
    constructor: (model, container) ->
        super()
        @type = model.type
        @model = model
        @originX = model.x
        @originY = model.y
        @scaleY = model.scaleY
        @container = container
        tl = new TimelineMax()
        @build()
        @on 'mouseover', @OnMouseOver
        @on 'mouseout', @OnMouseOut
        @on 'click', @onClick
    
    OnMouseOver: (evt)=>
        gsap.TweenMax.to @, .3,
            width: 0
            x: @model.x + @model.width / 2

    OnMouseOut: () =>
        gsap.TweenMax.to @, .3,
            width: @model.width
            x: @model.x
        
    onClick:=>
        @clicked = true
        @radio.emit("send:message","hola")
        #console.log @type
        #@animate()
        
    build:=>
 
      
        @beginFill('0xff00ff00')
        @lineStyle(2, "0xffffff")
        @drawRect(0,0, @model.width, @model.height)
        @endFill()
        @x = @model.x
        @y = @model.y
        @scaleY = @model.scaleY
        @container.addChild(@)

    animate:=>
        if @model.id == 'card'
            #gsap.TweenMax.to @, 1.5, scale:-1.5, opacity: 1,
            gsap.TweenMax.to @, 0.5, rotation:'180'
            #gsap.TweenLite.to @, 1, rotation:180, transformOrigin:"center bottom"
        console.log @scaleY

module.exports = BlockItemView