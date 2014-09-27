#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  getScore: (scores) ->
    if scores.length == 2 and scores[1] < 21
      scores[1]
    else
      scores[0]

  checkWinner: ->

    pScore = @getScore(@get('playerHand').scores())
    dScore = @getScore(@get('dealerHand').scores())

    result
    if dScore > 21 and pScore > 21
     result = 'Draw...'
    else if dScore > 21
      result = 'You Win!'
    else if pScore > 21
      result = 'Dealer Wins :('
    else if pScore < dScore
      result = 'Dealer Wins :('
    else
      result = 'You Win!'

    @trigger('winner', result)
