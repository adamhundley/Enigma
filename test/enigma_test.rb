require 'Minitest'
require 'Minitest/pride'
require 'Minitest/autorun'

require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_can_encrypt
    e = Enigma.new
    message = "this message is a test..end.."
    assert_equal "bq7jsv3jaj58sre1vgf8a2x2zw22t", e.encrypt(message, 54625, 141215)
  end

  def test_it_can_crack
    e = Enigma.new
    message = "bq7jsv3jaj58sre1vgf8a2x2zw22t"
    assert_equal 50325, e.crack(message, 141215)
  end

  


end
