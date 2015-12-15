require 'Minitest'          # => true
require 'Minitest/pride'    # => true
require 'Minitest/autorun'  # => true

require_relative '../lib/rotation_generator'  # => true

class RotationGeneratorTest < Minitest::Test
  def test_it_can_pass_a_key
    kg = RotationGenerator.new(56789, 111215)  # => #<RotationGenerator:0x007f8372959398 @key="56789", @date=111215>
    assert_equal "56789", kg.key               # => true
  end

  def test_it_can_take_a_date_that_starts_with_a_zero
    kg = RotationGenerator.new(56789, 011215)  # => #<RotationGenerator:0x007f837295ac48 @key="56789", @date=4749>
    assert_equal 011215, kg.date               # => true
  end

  def test_it_can_pass_a_set_date
    kg = RotationGenerator.new(56789, 111215)  # => #<RotationGenerator:0x007f8372962588 @key="56789", @date=111215>
    assert_equal 111215, kg.date               # => true
  end

  def test_it_can_produce_a_random_5_digit_key
    kg = RotationGenerator.new                  # => #<RotationGenerator:0x007f837296b0e8 @key="16532", @date=141215>
    assert_equal 5, kg.key.length               # => true
  end

  def test_it_can_offset_the_date
    kg = RotationGenerator.new(56789, 230586)   # => #<RotationGenerator:0x007f8372960648 @key="56789", @date=230586>
    assert_equal "53169903396", kg.date_offset  # => true
  end

  def test_it_can_create_date_offsets_by_taking_specific_indexes
    kg = RotationGenerator.new(56789, 230586)                     # => #<RotationGenerator:0x007f8372968460 @key="56789", @date=230586>
    assert_equal "3396", kg.date_offset[-4..-1]                   # => true
  end

  def test_it_can_grab_specific_key_indexs
    kg = RotationGenerator.new(56789, 230586)  # => #<RotationGenerator:0x007f8372969a68 @key="56789", @date=230586>
    assert_equal "56", kg.key[0..1]            # => true
  end
end

# >> Run options: --seed 43392
# >>
# >> # Running:
# >>
# >> [31m*[0m[32m*[0m[33m*[0m[34m*[0m[35m*[0m[36m*[0m[31m*[0m
# >>
# >> [31mF[0m[32ma[0m[33mb[0m[34mu[0m[35ml[0m[36mo[0m[31mu[0m[32ms[0m[33m [0m[34mr[0m[35mu[0m[36mn[0m in 0.000840s, 8333.3333 runs/s, 8333.3333 assertions/s.
# >>
# >> 7 runs, 7 assertions, 0 failures, 0 errors, 0 skips
