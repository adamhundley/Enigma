require_relative 'test_helper'
require 'Minitest'
require 'Minitest/pride'
require 'Minitest/autorun'

require_relative '../lib/decryptor'

class DecryptorTest < Minitest::Test
  def test_it_can_pass_a_message_and_chars_it
    d = Decryptor.new("z9cnr8c421c4otw8r2", 11425, 141215)

    assert_equal ["z", "9", "c", "n", "r", "8", "c", "4", "2",
      "1", "c", "4", "o", "t", "w", "8", "r", "2"], d.message
  end

  def test_it_created_character_map
    d = Decryptor.new("z9cnr8c421c4otw8r2", 11425, 141215)

    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
      "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3",
      "4", "5", "6", "7", "8", "9", " ", ".", ","], d.character_map
  end

  def test_it_can_pull_an_index_from_the_character_map
    d = Decryptor.new("z9cnr8c421c4otw8r2", 11425, 141215)

    assert_equal "i", d.character_map[8]
    assert_equal 10, d.character_map.index("k")
  end

  def test_it_can_convert_message_to_numbers
    d = Decryptor.new("z9cnr8c421c4otw8r2", 11425, 141215)

    assert_equal [25, 35, 2, 13, 17, 34, 2, 30, 28, 27, 2,
      30, 14, 19, 22, 34, 17, 28], d.find_message_character_values
  end

  def test_it_can_place_numbers_into_groups_of_four
    d = Decryptor.new("z9cnr8c421c4otw8r2", 11425, 141215)

    assert_equal [[25, 35, 2, 13], [17, 34, 2, 30], [28, 27, 2,
      30],[14, 19, 22, 34], [17, 28]], d.character_value_into_groups_of_four
  end

  def test_it_can_subtract_final_decryptor_values
    d = Decryptor.new("z9cnr8c421c4otw8r2", 11425, 141215)

    assert_equal [8, 19, 36, 22, 0, 18, 36, 0, 11, 11, 36, 0,
      36, 3, 17, 4, 0, 12], d.subtract_final_decryptor_values
  end

  def test_it_can_decrypt_to_chars
    d = Decryptor.new("z9cnr8c421c4otw8r2", 11425, 141215)

    assert_equal ["i", "t", " ", "w", "a", "s", " ", "a", "l", "l",
      " ", "a", " ", "d", "r", "e", "a", "m"], d.convert_values_to_characters
  end

  def test_it_can_decrypt_to_a_string
    d = Decryptor.new("z9cnr8c421c4otw8r2", 11425, 141215)

    assert_equal "it was all a dream", d.join_decrypted_characters_to_string
  end
end
