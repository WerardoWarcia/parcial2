Collection = require './PlantCollection'
ItemView = require './PlantItemView'
Radio = require 'nanoevents'

class PlantCollectionView extends PIXI.Container
    constructor: (app) ->
        super()
        @app = app
        @buildItemViews()
        app.stage.addChild(@)
        @radio.on "send:message", @sendMessage

    sendMessage:(msg)=>
        console.log "cacho un mensaje"

    buildItemView:=>
        for model in @Collection
            new ItemView(model,@)

module.exports = PlantCollectionView