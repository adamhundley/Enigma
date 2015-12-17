require_relative 'test_helper'
require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'

require_relative '../lib/character_map'

class CharacterMapTest < Minitest::Test
  def test_it_created_character_map
    c = CharacterMap.new

    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
      "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3",
      "4", "5", "6", "7", "8", "9", " ", ".", ","], c.character_map
  end
end
