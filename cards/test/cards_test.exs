defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  describe "testes de sucesso" do
    test "create_deck makes 20 cards" do
      deck_length = length(Cards.create_deck())
      assert deck_length == 20
    end

    test "shuffling a deck randomizes it" do
      deck = Cards.create_deck()
      refute deck == Cards.shuffle(deck)
    end

    test "contains is successful" do
      deck = [
        "Ace of Spades",
        "Two of Spades",
        "Three of Spades",
        "Four of Spades",
        "Five of Spades",
        "Ace of Clubs",
        "Two of Clubs",
        "Three of Clubs",
        "Four of Clubs",
        "Five of Clubs",
        "Ace of Hearts",
        "Two of Hearts",
        "Three of Hearts",
        "Four of Hearts",
        "Five of Hearts",
        "Ace of Diamonds",
        "Two of Diamonds",
        "Three of Diamonds",
        "Four of Diamonds",
        "Five of Diamonds"
      ]

      card = "Ace of Spades"

      params = Cards.contains?(deck, card)

      assert true == params
    end

    test "deal is successful" do
      deck = Cards.create_deck()
      hand_size = 2

      params = Cards.deal(deck, hand_size)

      assert {["Ace of Spades", "Two of Spades"],
              [
                "Three of Spades",
                "Four of Spades",
                "Five of Spades",
                "Ace of Clubs",
                "Two of Clubs",
                "Three of Clubs",
                "Four of Clubs",
                "Five of Clubs",
                "Ace of Hearts",
                "Two of Hearts",
                "Three of Hearts",
                "Four of Hearts",
                "Five of Hearts",
                "Ace of Diamonds",
                "Two of Diamonds",
                "Three of Diamonds",
                "Four of Diamonds",
                "Five of Diamonds"
              ]} == params
    end

    test "save is successful" do
      deck = Cards.create_deck()
      filename = "abcdefg"

      params = Cards.save(deck, filename)

      assert :ok == params
    end

    test "load is successful" do
      filename = "my_deck"

      params = Cards.load(filename)

      assert [
               "Ace of Spades",
               "Two of Spades",
               "Three of Spades",
               "Four of Spades",
               "Five of Spades",
               "Ace of Clubs",
               "Two of Clubs",
               "Three of Clubs",
               "Four of Clubs",
               "Five of Clubs",
               "Ace of Hearts",
               "Two of Hearts",
               "Three of Hearts",
               "Four of Hearts",
               "Five of Hearts",
               "Ace of Diamonds",
               "Two of Diamonds",
               "Three of Diamonds",
               "Four of Diamonds",
               "Five of Diamonds"
             ] == params
    end
  end
end
