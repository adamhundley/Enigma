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
      30],[14, 19, 22, 34], [17, 28]], d.split_character_value_into_groups_of_four
  end

  def test_it_can_subtract_final_decryptor_values
    d = Decryptor.new("z9cnr8c421c4otw8r2", 11425, 141215)

    assert_equal [8, 19, 36, 22, 0, 18, 36, 0, 11, 11, 36, 0,
      36, 3, 17, 4, 0, 12], d.subtract_final_decryptor_values
  end

  def test_it_can_pull_rotation_values_from_the_generator
    d = Decryptor.new("z9cnr8c421c4otw8r2", 11425, 141215)

    assert_equal 17, d.rotation.a_rotation
    assert_equal 16, d.rotation.b_rotation
    assert_equal 44, d.rotation.c_rotation
    assert_equal 30, d.rotation.d_rotation
  end

  def test_it_can_decrypt
    d = Decryptor.new("z9cnr8c421c4otw8r2", 11425, 141215)

    assert_equal "it was all a dream", d.convert_values_to_characters
  end
end
