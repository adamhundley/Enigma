# require_relative 'test_helper'
require 'Minitest'          # => true
require 'Minitest/pride'    # => true
require 'Minitest/autorun'  # => true

require_relative '../lib/enigma'  # => true

class EnigmaTest < Minitest::Test
  def test_it_can_encrypt
    e = Enigma.new                 # => #<Enigma:0x007f91d989eb68>

    message = "this message is a test..end.."  # => "this message is a test..end.."

    assert_equal ".6f3p.b3 zdpp7piswqp f8jw,ajq", e.encrypt(message, "12345", 141215)  # => true
  end

  def test_it_can_decrypt
    e = Enigma.new         # => #<Enigma:0x007f91d9887c10>

    message = ".6f3p.b3 zdpp7piswqp f8jw,ajq"  # => ".6f3p.b3 zdpp7piswqp f8jw,ajq"

    assert_equal "this message is a test..end..", e.decrypt(message, "12345", 141215)  # => true
  end

  def test_it_can_encrypt_without_inputting_date
    e = Enigma.new                                # => #<Enigma:0x007f91d99894b0>

    message = "this message is a test..end.."  # => "this message is a test..end.."

    assert_equal ".6f3p.b3 zdpp7piswqp f8jw,ajq", e.encrypt(message, "12345")  # => true
  end

  def test_it_can_encrypt_without_inputting_a_key
    e = Enigma.new                                 # => #<Enigma:0x007f91da8349b0>

    message = "this message is a test..end.."  # => "this message is a test..end.."

    refute_equal ".6f3p.b3 zdpp7piswqp f8jw,ajq", e.encrypt(message)  # => false
  end

  def test_it_can_decrypt_without_inputting_the_date
    e = Enigma.new                                    # => #<Enigma:0x007f91da826680>

    message = ".6f3p.b3 zdpp7piswqp f8jw,ajq"  # => ".6f3p.b3 zdpp7piswqp f8jw,ajq"

    assert_equal "this message is a test..end..", e.decrypt(message, "12345")  # => true
  end

  def test_it_can_take_just_the_known_crack_values
    e = Enigma.new                                  # => #<Enigma:0x007f91d9969480>

    message = "2fxhgg7zj8861rn0nls0h"  # => "2fxhgg7zj8861rn0nls0h"

    assert_equal "this is a test..end..", e.crack(message, "141215")
  end

end

# >> Run options: --seed 7123
# >>
# >> # Running:
# >>
# >> [38;5;154m.[0m[38;5;154m.[0m[38;5;148m.[0m[38;5;184m.[0m[38;5;184m.[0m[41m[37mE[0m
# >>
# >> [38;5;154mF[0m[38;5;154ma[0m[38;5;148mb[0m[38;5;184mu[0m[38;5;184ml[0m[38;5;214mo[0m[38;5;214mu[0m[38;5;208ms[0m[38;5;208m [0m[38;5;203mr[0m[38;5;203mu[0m[38;5;198mn[0m in 0.002473s, 2426.2030 runs/s, 2021.8358 assertions/s.
# >>
# >>   1) Error:
# >> EnigmaTest#test_it_can_take_just_the_known_crack_values:
# >> TypeError: nil can't be coerced into Fixnum
# >>     /Users/adamhundley/Turing/1module/Enigma/lib/crack.rb:88:in `-'
# >>     /Users/adamhundley/Turing/1module/Enigma/lib/crack.rb:88:in `block (2 levels) in subtract_final_crack_values'
# >>     /Users/adamhundley/Turing/1module/Enigma/lib/crack.rb:86:in `each'
# >>     /Users/adamhundley/Turing/1module/Enigma/lib/crack.rb:86:in `each_with_index'
# >>     /Users/adamhundley/Turing/1module/Enigma/lib/crack.rb:86:in `block in subtract_final_crack_values'
# >>     /Users/adamhundley/Turing/1module/Enigma/lib/crack.rb:85:in `each'
# >>     /Users/adamhundley/Turing/1module/Enigma/lib/crack.rb:85:in `subtract_final_crack_values'
# >>     /Users/adamhundley/Turing/1module/Enigma/lib/crack.rb:106:in `convert_values_to_characters'
# >>     /Users/adamhundley/Turing/1module/Enigma/lib/crack.rb:112:in `join_cracked_characters_to_string'
# >>     /Users/adamhundley/Turing/1module/Enigma/lib/enigma.rb:21:in `crack'
# >>     /Users/adamhundley/Turing/1module/Enigma/test/enigma_test.rb:54:in `test_it_can_take_just_the_known_crack_values'
# >>
# >> 6 runs, 5 assertions, 0 failures, 1 errors, 0 skips
