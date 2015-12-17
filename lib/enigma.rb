require_relative 'encryptor'
require_relative 'cracker'
require_relative 'decryptor'

class Enigma
  def encrypt(message, key = rand(0..99999), date = Time.new.strftime("%d""%m""%y"))
    Encryptor.new(message, key, date).encrypt_values_to_characters
  end

  def decrypt(message, key, date = Time.new.strftime("%d""%m""%y"))
    Decryptor.new(message, key, date).convert_values_to_characters
  end

  def crack(message, date = Time.new.strftime("%d""%m""%y"))
    Crack.new(message, date).convert_values_to_characters
  end
end
