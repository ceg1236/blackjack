class window.HandView extends Backbone.View

  className: 'hand'

  #todo: switch to mustache
  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()

    @collection.on 'checkWinner', (gameover) =>
      @render(gameover)

  render:(gameover) ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    if(gameover)
      @$('.score').text @collection.getScore(@collection.scores())
    else
      @$('.score').text @collection.scores()
