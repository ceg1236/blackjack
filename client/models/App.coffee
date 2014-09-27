#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  checkWinner: ->
    pScore = @get('playerHand').scores()
    dScore = @get('dealerHand').scores()

    result

    if dScore > 21 and pScore > 21
     result = 'Draw'
    else if dScore > 21
      result = 'You Win'
    else if pScore > 21
      result = 'Dealer Wins'
    else if pScore < dScore
      result = 'Dealer Wins'
    else
      result = 'You Win'

    @trigger('winner', result)
