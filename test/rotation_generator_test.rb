require 'Minitest'
require 'Minitest/pride'
require 'Minitest/autorun'

require_relative '../lib/rotation_generator'

class RotationGeneratorTest < Minitest::Test
  def test_it_can_pass_a_key
    kg = RotationGenerator.new(56789, 111215)
    assert_equal "56789", kg.key
  end

  def test_it_can_produce_a_random_5_digit_number
    kg = RotationGenerator.new
    assert_equal 5, kg.key.length
  end

  def test_it_can_take_a_date_different_than_today
    kg = RotationGenerator.new(56789, 230586)
    assert_equal 230586, kg.date
  end

  def test_it_can_offset_the_date
    kg = RotationGenerator.new(56789, 230586)
    assert_equal "53169903396", kg.date_offset
  end

  def test_it_can_create_key_rotations
    skip
    kg = RotationGenerator.new(56789, 230586)
    kg.key_with_date_offset
    assert_equal 213, kg.a_rotation
  end
end
