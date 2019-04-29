Circle = require("./elements/Circle")
DataCircle = require('./data/circles')
#SceneContainer = require ('./modules/scenes/SceneContainer')
_ = require 'underscore'
BlockCollectionView = require('./modules/scenes/blocks/BlockCollectionView')

class App extends PIXI.Application
  animation:true
  animationNodes:[]
  col:10
  row:10
  constructor:(w,h,o)->
    height = window.innerHeight/10
    width = window.innerWidth/10
    super(w,h,o)
    document.body.appendChild @view
    @build()
    @animate()
    #window.addEventListener 'mouseover', @OnMouseOver

  build:=>
    blockContainer = new BlockCollectionView (@)
    null

    #OnMouseOver: (evt)=>
  #  console.log 'hi'

  addAnimationNodes:(child)=>
    @animationNodes.push child
    null


  animate:=>
    @ticker.add ()=>
      for n in @animationNodes
        n.animate?()

    null

module.exports = App
