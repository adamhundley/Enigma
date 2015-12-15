require_relative 'test_helper'
require 'Minitest'
require 'Minitest/pride'
require 'Minitest/autorun'

require_relative '../lib/rotation_generator'

class RotationGeneratorTest < Minitest::Test

  def test_it_can_pass_a_key
    kg = RotationGenerator.new(56789, 111215)
    assert_equal "56789", kg.key
  end

  def test_it_can_pass_a_set_date
    kg = RotationGenerator.new(56789, 111215)
    assert_equal 111215, kg.date
  end

  # def test_it_can_take_a_date_that_starts_with_a_zero
  #   kg = RotationGenerator.new(56789, 011215)
  #   assert_equal 011215, kg.date
  # end

  # def test_it_can_pass_a_key_that_starts_with_a_zero
  #   skip
  #   kg = RotationGenerator.new(06789, 111215)
  #   assert_equal "06789", kg.key
  # end

  def test_it_can_square_the_date
    kg = RotationGenerator.new(56789, 230586)
    assert_equal "53169903396", kg.date_offset
  end

  def test_it_can_create_date_offsets_by_taking_last_four_digits
    kg = RotationGenerator.new(56789, 230586)
    assert_equal "3396", kg.date_offset[-4..-1]
  end

  def test_it_can_grab_specific_key_indexs
    kg = RotationGenerator.new(56789, 230586)
    assert_equal "56", kg.key[0..1]
  end

  def test_the_key_rotation_pulls_correct_values
    kg = RotationGenerator.new(56789, 230586)
    assert_equal 56, kg.a_key_rotation
    assert_equal 67, kg.b_key_rotation
    assert_equal 78, kg.c_key_rotation
    assert_equal 89, kg.d_key_rotation
  end

  def test_it_can_create_the_rotation
    kg = RotationGenerator.new(56789, 230586)
    kg.a_key_rotation
    assert_equal 59, kg.a_rotation
    assert_equal 70, kg.b_rotation
    assert_equal 87, kg.c_rotation
    assert_equal 95, kg.d_rotation
  end
end
