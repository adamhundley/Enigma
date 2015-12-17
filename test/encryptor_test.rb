require_relative 'test_helper'
require 'Minitest'
require 'Minitest/pride'
require 'Minitest/autorun'

require_relative '../lib/encryptor'

class EncryptorTest < Minitest::Test
  def test_it_can_pass_a_message_and_chars_it
    e = Encryptor.new("it was all a dream", "11425", "141215")

    assert_equal ["i", "t", " ", "w", "a", "s", " ", "a", "l",
      "l", " ", "a", " ", "d", "r", "e", "a", "m"], e.message
  end

  def test_it_can_pull_an_index_from_the_character_map
    e = Encryptor.new("it was all a dream", "11425", "141215")

    assert_equal "i", e.character_map[8]
    assert_equal 10, e.character_map.index("k")
  end

  def test_it_can_convert_message_to_numbers
    e = Encryptor.new("it was all a dream", "11425", "141215")

    assert_equal [8, 19, 36, 22, 0, 18, 36, 0, 11, 11, 36,
      0, 36, 3, 17, 4, 0, 12], e.find_message_character_values
  end

  def test_it_can_place_numbers_into_groups_of_four
    e = Encryptor.new("it was all a dream", "11425", "141215")

    assert_equal [[8, 19, 36, 22],[0, 18, 36, 0], [11, 11, 36,
      0], [36, 3, 17, 4], [0, 12]], e.split_character_value_into_groups_of_four
  end

  def test_it_can_add_final_encryptor_values
    e = Encryptor.new("it was all a dream", "11425", "141215")

    assert_equal [25, 35, 2, 13, 17, 34, 2, 30, 28, 27, 2, 30, 14, 19,
      22, 34, 17, 28], e.add_final_encryptor_values
  end

  def test_it_can_pull_rotation_values_from_the_generator
    e = Encryptor.new("it was all a dream", "11425", "141215")

    assert_equal 17, e.rotation.a_rotation
    assert_equal 16, e.rotation.b_rotation
    assert_equal 44, e.rotation.c_rotation
    assert_equal 30, e.rotation.d_rotation
  end

  def test_it_can_encrypt
    e = Encryptor.new("it was all a dream", "11425", "141215")

    assert_equal "z9cnr8c421c4otw8r2", e.encrypt_values_to_characters
  end
end
