require_relative 'test_helper'
require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'

require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_can_encrypt
    e = Enigma.new

    message = "this message is a test..end.."

    assert_equal ".6f3p.b3 zdpp7piswqp f8jw,ajq", e.encrypt(message, "12345", 141215)
  end

  def test_it_can_decrypt
    e = Enigma.new

    message = ".6f3p.b3 zdpp7piswqp f8jw,ajq"

    assert_equal "this message is a test..end..", e.decrypt(message, "12345", 141215)
  end

  def test_it_can_encrypt_without_inputting_date
    e = Enigma.new

    message = "this message is a test..end.."

    assert_equal ".6f3p.b3 zdpp7piswqp f8jw,ajq", e.encrypt(message, "12345")
  end

  def test_it_can_encrypt_without_inputting_a_key
    e = Enigma.new

    message = "this message is a test..end.."

    refute_equal ".6f3p.b3 zdpp7piswqp f8jw,ajq", e.encrypt(message)
  end

  def test_it_can_decrypt_without_inputting_the_date
    e = Enigma.new

    message = ".6f3p.b3 zdpp7piswqp f8jw,ajq"

    assert_equal "this message is a test..end..", e.decrypt(message, "12345")
  end

  def test_it_can_take_just_the_known_crack_values
    e = Enigma.new

    message = "2fxhgg7zj8861rn0nls0h"

    assert_equal "this is a test..end..", e.crack(message, "141215")
  end
end
