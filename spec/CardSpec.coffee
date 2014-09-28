assert = chai.assert

describe "deck constructor", ->
  deck = null

  beforeEach ->
    deck = new Deck()
    sinon.spy()

  it "should create a card collection", ->

    assert.strictEqual deck.length, 52

  it "should reveal a card when flipped", ->
    card = deck.pop()
    card.flip()
    assert.equal(card.get('revealed'), false)
    card.flip()
    assert.equal(card.get('revealed'), true)


