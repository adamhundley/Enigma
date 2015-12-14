require 'Minitest'
require 'Minitest/pride'
require 'Minitest/autorun'

require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_initializes
    skip
    e = Enigma.new("balls")
    assert_equal "balls", e.message
  end




end
