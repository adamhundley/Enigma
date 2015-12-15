require_relative 'rotation_generator'  # => true

class Encryptor
  attr_reader :message, :rotation  # => nil

  def initialize(message, key, date)
    @message = message.chars
    @rotation = RotationGenerator.new(key, date)
    create_character_map
  end

  def create_character_map
    character_map = %w(a b c d e f g h i j k l m n o p q r
    s t u v w x y z 0 1 2 3 4 5 6 7 8 9)
    character_map << " " << "." << ","
  end

  def find_message_character_values
    @message.map do |character|
      create_character_map.index(character)
    end
  end

  def character_value_into_groups_of_four
    character_values_in_group_of_four = []
    find_message_character_values.each_slice(4) do |character|
    character_values_in_group_of_four << character
    end
    character_values_in_group_of_four
  end

  def add_final_encryptor_values   # rotations = [keys, offsets].transpose.map {|rotation| rotation.reduce(:+)}
    final_encryptor_values = []
    character_value_into_groups_of_four.each do |group|
      group.each_with_index do |character, index|
        if index == 0
          a_final_rotation = rotation.a_rotation + character
          final_encryptor_values << a_final_rotation % 39
        elsif index == 1
          b_final_rotation = rotation.b_rotation + character
          final_encryptor_values << b_final_rotation % 39
        elsif index == 2
          c_final_rotation = rotation.c_rotation + character
          final_encryptor_values << c_final_rotation % 39
        else index == 3
          d_final_rotation = rotation.d_rotation + character
          final_encryptor_values << d_final_rotation % 39
        end
      end
    end
    final_encryptor_values
  end

  def encrypt_values_to_characters
    final_message = add_final_encryptor_values.map do |value|
      create_character_map[value]
    end
    final_message.join
  end
end

# #
# test = Encryptor.new("..en")                                   # => #<Encryptor:0x007fb9ba911fb0 @message=[".", ".", "e", "n"], @rotation=#<RotationGenerator:0x007fb9ba911ce0 @key="11425", @date=141215>>
# test.create_character_map                                      # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
# test.find_message_character_values                             # => [37, 37, 4, 13]
# test.character_value_into_groups_of_four                       # => [[37, 37, 4, 13]]
# test.add_final_encryptor_values                                # => [15, 14, 9, 4]
# test.encrypt_values_to_characters                              # => "poje"
