require 'Minitest'
require 'Minitest/pride'
require 'Minitest/autorun'

require_relative '../lib/encryptor'

class EncryptorTest < Minitest::Test
  def test_it_can_pass_a_message_and_chars_it
    e = Encryptor.new("test")
    assert_equal ["t", "e", "s", "t"], e.message
  end

  def test_it_created_character_map
    e = Encryptor.new("test")

    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
      "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3",
      "4", "5", "6", "7", "8", "9", " ", ".", ","], e.create_character_map
  end

  def test_it_can_convert_message_to_numbers
    e = Encryptor.new("test")
    e.create_character_map
    e.find_message_character_values
    assert_equal [19, 4, 18, 19], e.find_message_character_values
  end

  

end
