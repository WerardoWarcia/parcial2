Collection = require './BlockCollection'
ItemView = require './BlockItemView'
class BlockCollectionView extends PIXI.Container
    collection: Collection
    constructor:(app) ->
        super()
        @app = app
        @app.stage.addChild(@)
        @buildItemViews()
    buildItemViews:=>
        for model in @collection
            console.log model
            item = new ItemView(model, @)
    separateByColors:(type)=>
        for child in @children
            if child.type == type
                console.log buenas


module.exports = BlockCollectionView