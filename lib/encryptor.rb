require_relative 'rotation_generator'  # => true

class Encryptor
  # attr_accessor :a_rotation  # => nil
  attr_reader :message  # => nil

  def initialize(message)
    @message = message.chars           # => ["t", "e", "s", "t"]
    @rotation = RotationGenerator.new  # => #<RotationGenerator:0x007fa9b2081610 @key="80123", @date=121215>
  end

  def create_character_map
    @character_map = %w(a b c d e f g h i j k l m n o p q r
    s t u v w x y z 0 1 2 3 4 5 6 7 8 9)  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @character_map << " " << "." << ","   # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  end

  def find_message_character_values
    @character_values = @message.map do |character|  # => ["t", "e", "s", "t"]
      @character_map.index(character)                # => 19, 4, 18, 19
    end                                              # => [19, 4, 18, 19]
  end

  def add_rotation_to_character_values
    @a_final_rotation = @rotation.a_rotation + @character_values[0]  # ~> NoMethodError: undefined method `[]' for nil:NilClass
    @b_final_rotation = @rotation.b_rotation + @character_values[1]
    @c_final_rotation = @rotation.c_rotation + @character_values[2]
    @d_final_rotation = @rotation.d_rotation + @character_values[3]
  end

end

test = Encryptor.new("test")           # => #<Encryptor:0x007fa9b2081958 @message=["t", "e", "s", "t"], @rotation=#<RotationGenerator:0x007fa9b2081610 @key="80123", @date=121215>>
test.create_character_map              # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
test.find_message_character_values     # => [19, 4, 18, 19]
test.add_rotation_to_character_values

# ~> NoMethodError
# ~> undefined method `[]' for nil:NilClass
# ~>
# ~> /Users/adamhundley/Turing/1module/Enigma/lib/rotation_generator.rb:22:in `a_rotation'
# ~> /Users/adamhundley/Turing/1module/Enigma/lib/encryptor.rb:25:in `add_rotation_to_character_values'
# ~> /Users/adamhundley/Turing/1module/Enigma/lib/encryptor.rb:36:in `<main>'
