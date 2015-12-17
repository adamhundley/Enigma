require_relative 'test_helper'
require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'

require_relative '../lib/cracker'

class CrackTest < Minitest::Test
  def test_it_can_convert_encrypted_message_to_an_array_of_character_strings
    c = Crack.new("test", 141215)

    assert_equal ["t", "e", "s", "t"], c.message
  end

  def test_it_can_convert_character_strings_into_map_values
    c = Crack.new("lxwc2y6u5n71k9mv93rv3", 141215)

    assert_equal [11, 23, 22, 2, 28, 24, 32, 20, 31, 13, 33, 27,
       10, 35, 12, 21, 35, 29, 17, 21, 29], c.find_message_character_values
  end

  def test_it_can_find_the_message_lenght_and_modulo
    c = Crack.new("lxwc2y6u5n71k9mv93rv3", 141215)

    assert_equal 1, c.count_in
  end

  def test_it_can_take_just_the_known_crack_values
    c = Crack.new("lxwc2y6u5n71k9mv93rv3", 141215)

    assert_equal [35, 29, 17, 21], c.encrypted_character_values_of_the_end
  end

  def test_it_can_find_the_encrypted_message_values
    c = Crack.new("..end..", 141215)

    assert_equal [37, 37, 4, 13, 3, 37, 37], c.crack_cipher_character_values
  end

  def test_it_can_count_in_on_the_cipher
    c = Crack.new("..end..", 141215)

    assert_equal [37, 37, 4, 13], c.find_abcd_values
  end

  def test_it_can_find_the_roatation_values
    c = Crack.new("lxwc2y6u5n71k9mv93rv3", 141215)

    assert_equal [31, 16, 14, 23], c.determine_rotation_values
  end

  def test_it_can_determine_the_a_rotation
    c = Crack.new("lxwc2y6u5n71k9mv93rv3", 141215)

    assert_equal 31, c.key_a
  end

  def test_it_can_determine_the_b_rotation
    c = Crack.new("lxwc2y6u5n71k9mv93rv3", 141215)

    assert_equal 16, c.key_b
  end

  def test_it_can_determine_the_c_rotation
    c = Crack.new("lxwc2y6u5n71k9mv93rv3", 141215)

    assert_equal 14, c.key_c
  end

  def test_it_can_determine_the_d_rotation
    c = Crack.new("lxwc2y6u5n71k9mv93rv3", 141215)

    assert_equal 23, c.key_d
  end

  def test_it_can_crack
    c = Crack.new("2fxhgg7zj8861rn0nls0h", 161515)

    assert_equal "this is a test..end..", c.convert_values_to_characters
  end
end
