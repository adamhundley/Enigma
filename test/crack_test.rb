# require 'test_helper'
require 'Minitest'
require 'Minitest/pride'
require 'Minitest/autorun'

require_relative '../lib/crack'

class CrackTest < Minitest::Test
  def test_it_can_convert_encrypted_message_to_an_array_of_character_strings
    c = Crack.new("test", 141215)
    assert_equal ["t", "e", "s", "t"], c.message
  end

  def test_it_can_convert_character_strings_into_map_values
    c = Crack.new("test", 141215)
    assert_equal [19, 4, 18, 19], c.find_message_character_values
  end

  def test_the_actual_end_converts_to_values
    c = Crack.new("..end..", 141215)
    assert_equal [37, 37, 4, 13, 3, 37, 37], c.find_message_character_values
  end

  def test_it_can_find_the_message_lenght_and_modulo
    c = Crack.new("..end..", 141215)
    assert_equal 3, c.count_in
  end

  def test_it_can_take_just_the_known_crack_values
    c = Crack.new("..end..", 141215)
    assert_equal [37, 37, 4, 13], c.encrypted_character_values_of_the_end
  end

  def test_it_can_find_the_encrypted_message_values
    c = Crack.new("pojeuod", 141215)
    assert_equal [15, 14, 9, 4, 20, 14, 3], c.find_message_character_values
  end

  def test_it_can_crack
    c = Crack.new("2fxhgg7zj8861rn0nls0h", 161515)
    assert_equal "this is a test..end..", c.join_cracked_characters_to_string
  end
end
