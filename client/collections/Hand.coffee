class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()
    @checkBusted()

  stand: ->
    @trigger('stand', @)

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]

  checkBusted: ->
    console.log('score', @scores())
    # is scores length 2
    # if so, and both > 21, busted
    # if only one elmt, only check that

    if @scores()[0] > 21 then @trigger('busted', @)

  dealer: ->
    while @scores() < 17
      @hit()
    @trigger('checkWinner', @)

