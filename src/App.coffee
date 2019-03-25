Circle = require("./elements/Circle")
DataCircle = require('./data/circles')
#SceneContainer = require ('./modules/scenes/SceneContainer')
_ = require 'underscore'
BlockCollectionView = require('./modules/scenes/blocks/BlockCollectionView')

class App extends PIXI.Application
  animation:true
  animationNodes:[]
  constructor:(w,h,o)->
    super(w,h,o)
    document.body.appendChild @view
    @build()
    @animate()

  build:=>
    blockContainer = new BlockCollectionView (@)
    null

  addAnimationNodes:(child)=>
    @animationNodes.push child
    null

  animate:=>
    @ticker.add ()=>
      for n in @animationNodes
        n.animate?()

    null

module.exports = App
