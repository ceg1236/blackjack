assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it "should give the last card from the deck", ->
      assert.strictEqual deck.length, 50
      deckLast = deck.last()
      handHit = hand.hit()
      console.log('DL', deckLast,'HH', handHit)
      assert.strictEqual deck.last(), hand.hit()
      # assert.strictEqual deck.length, 49
      # (assert.strictEqual deck.last(), hand.hit())
      # (assert.strictEqual deck.length, 48)
