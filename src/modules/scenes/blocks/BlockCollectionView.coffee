Collection = require './BlockCollection'
ItemView = require './BlockItemView'
class BlockCollectionView extends PIXI.Container
    collection: Collection
    blocks:8
    constructor:(app) ->
        super()
        @app = app
        @app.stage.addChild(@)
        @buildItemViews()
    buildItemViews:=>
        w=window.innerWidth/@blocks
        h=window.innerHeight/@blocks
        for row in [0...@blocks]
            for columns in [0...@blocks]
                model = {x:w*columns, y:h*row, width: w, height:h}
                item = new ItemView(model, @) 
    separateByColors:(type)=>
        for child in @children
            if child.type == type
                console.log buenas


module.exports = BlockCollectionView