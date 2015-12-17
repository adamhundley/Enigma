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
    Cracker.new(message, date).convert_values_to_characters
  end

end

#
# e = Enigma.new
# message = "lets go lets go l e t s g o..end.."
# e.encrypt(message, 43521)
# e.decrypt("vc8fhe3xvc8fhe3xv8tx387xq83yic23i9", 43521)
# e.crack("vc8fhe3xvc8fhe3xv8tx387xq83yic23i9")
