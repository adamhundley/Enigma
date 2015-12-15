require 'test_helper'
require 'Minitest'
require 'Minitest/pride'
require 'Minitest/autorun'

require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_can_encrypt
    e = Enigma.new
    message = "this message is a test..end.."
    assert_equal ".6f3p.b3 zdpp7piswqp f8jw,ajq", e.encrypt(message, 12345, 141215)
  end

  def test_it_can_crack
    e = Enigma.new
    message = "bq7jsv3jaj58sre1vgf8a2x2zw22t"
    assert_equal 54625, e.crack(message, 141215)
  end
end
