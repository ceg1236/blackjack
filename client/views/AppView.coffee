class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="result"></div>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()


  initialize: ->
    @render()
    @model.get('playerHand').on('busted stand', =>
      $('button').prop('disabled', true)
      @model.get('dealerHand').dealer()
    )

    @model.get('dealerHand').on('checkWinner', =>
      @model.checkWinner()
    )

    @model.on('winner', (winner) =>
      $('.result').text(winner)

    )

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
