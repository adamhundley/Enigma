require_relative 'encryptor'
require_relative 'crack'
require_relative 'decryptor'

class Enigma
  attr_reader :message, :date

  def initialize

  end

  def encrypt(message, key = rand(0..99999), date = Time.new.strftime("%d""%m""%y"))
    Encryptor.new(message, key, date).encrypt_values_to_characters
  end

  def decrypt(message, key, date = Time.new.strftime("%d""%m""%y"))
    Decryptor.new(message, key, date).convert_values_to_letters
  end

  def crack(message, date = Time.new.strftime("%d""%m""%y"))
    Crack.new(message, date).create_key_from_values
  end

end

e = Enigma.new
message = "this is a test..end.."
e.encrypt(message, 43523, 121515)
e.decrypt("2fxhgg7zj8861rn0nls0h", 43523, 121515)
