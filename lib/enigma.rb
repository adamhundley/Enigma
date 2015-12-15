require_relative 'encryptor'
require_relative 'crack'

class Enigma
  attr_reader :message, :date

  def initialize

  end

  def encrypt(message, key = rand(0..99999), date = Time.new.strftime("%d""%m""%y"))
    Encryptor.new(message, key, date).encrypt_values_to_characters
  end

  def decrypt

  end

  def crack(message, date = Time.new.strftime("%d""%m""%y"))
    Crack.new(message, date).create_key_from_values
  end

end

e = Enigma.new
message = "this is a test..end.."
e.encrypt(message)

#a key @key[0..1].to_i
#b key 1..2
#c key 2..3
#d key 3..4
