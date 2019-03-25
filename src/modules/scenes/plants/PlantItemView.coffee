class PlantItemView extends PIXI.Graphics
    constructor: (model) ->
        super() 
        @model = model
    build:=>
        @beginFill '0xfff00'
        @drawRect(0,0, @model.width)