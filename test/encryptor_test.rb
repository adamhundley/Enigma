require 'Minitest'
require 'Minitest/pride'
require 'Minitest/autorun'

require_relative '../lib/encryptor'

class EncryptorTest < Minitest::Test
  def test_it_can_pass_a_message_and_chars_it
    e = Encryptor.new("it was all a dream")

    assert_equal ["i", "t", " ", "w", "a", "s", " ", "a", "l",
      "l", " ", "a", " ", "d", "r", "e", "a", "m"], e.message
  end

  def test_it_created_character_map
    e = Encryptor.new("it was all a dream")

    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
      "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3",
      "4", "5", "6", "7", "8", "9", " ", ".", ","], e.create_character_map
  end

  def test_it_can_pull_an_index_from_the_character_map
    e = Encryptor.new("it was all a dream")

    assert_equal "i", e.create_character_map[8]
    assert_equal 10, e.create_character_map.index("k")
  end

  def test_it_can_convert_message_to_numbers
    e = Encryptor.new("it was all a dream")
    e.find_message_character_values
    assert_equal [8, 19, 36, 22, 0, 18, 36, 0, 11, 11, 36,
      0, 36, 3, 17, 4, 0, 12], e.find_message_character_values
  end

  def test_it_can_place_numbers_into_groups_of_four
    e = Encryptor.new("it was all a dream")
    assert_equal [[8, 19, 36, 22],[0, 18, 36, 0], [11, 11, 36,
      0], [36, 3, 17, 4], [0, 12]], e.character_value_into_groups_of_four
  end
  
end
