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

  def test_it_subtracts_character_values_from_39
    c = Crack.new("pojeuod", 141215)
    assert_equal [2, 2, 35, 26], c.subtract_character_values_from_39
  end

  def test_it_adds_encrypted_values_to_subtracted_values
    c = Crack.new("pojeuod", 141215)
    assert_equal [17, 16, 44, 30], c.add_encrypted_values_to_subtracted_values
  end

  def test_it_subtracts_date_from_values
    c = Crack.new("pojeuod", 141215)
    assert_equal [11, 14, 3, 25], c.subtract_date_from_values
  end

  def test_it_can_create_key_from_values
    c = Crack.new("pojeuod", 141215)
    assert_equal 11425, c.create_key_from_values
  end
end
