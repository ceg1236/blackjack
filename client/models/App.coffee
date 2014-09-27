#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  checkWinner: ->
    pScore = @get('playerHand').scores()
    dScore = @get('dealerHand').scores()

    if dScore > 21 and pScore > 21
     console.log('draw')
    else if dScore > 21
     console.log('player wins')
    else if pScore > 21
     console.log('dealer wins')
    else if pScore < dScore
     console.log('dealer WINS')
    else
      console.log('plaer WINS')
