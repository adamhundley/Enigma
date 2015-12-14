require_relative 'encryptor'

class Enigma
  attr_reader :message

  def initialize(message)
    @message = Encryptor.new(message)
  end

  def encrypt
  end

  def decrypt
  end

  def crack
  end

end


# def def initialize(key = Random.rand(0.99999).ts_s)
#   @key = key
#
# end
# @key
#
# pass the key in as an argument

#a key @key[0..1].to_i
#b key 1..2
#c key 2..3
#d key 3..4
