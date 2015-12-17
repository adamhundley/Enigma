require_relative 'rotation_generator'

class Decryptor
  attr_reader :rotation, :message, :character_map

  def initialize(message, key, date)
    @message = message.chars
    @key = key
    @date = date
    @rotation = RotationGenerator.new(key, date)
    @character_map  = create_character_map
  end

  def create_character_map
    character_map = %w(a b c d e f g h i j k l m n o p q r
    s t u v w x y z 0 1 2 3 4 5 6 7 8 9)
    character_map << " " << "." << ","
  end

  def find_message_character_values
    message.map do |character|
      character_map.index(character)
    end
  end

  def split_character_value_into_groups_of_four
    groups_of_four = []
    find_message_character_values.each_slice(4) do |character|
    groups_of_four << character
    end
    groups_of_four
  end

  def subtract_final_decryptor_values
    final_decryptor_values = []
    split_character_value_into_groups_of_four.each do |group|
      group.each_with_index do |value, index|
        if index == 0
          a_final_value = value - rotation.a_rotation
          final_decryptor_values << a_final_value % 39
        elsif index == 1
          b_final_value = value - rotation.b_rotation
          final_decryptor_values << b_final_value % 39
        elsif index == 2
          c_final_value = value - rotation.c_rotation
          final_decryptor_values << c_final_value % 39
        elsif index == 3
          d_final_value = value - rotation.d_rotation
          final_decryptor_values << d_final_value % 39
        end
      end
    end
    final_decryptor_values
  end

  def convert_values_to_characters
    final_message = subtract_final_decryptor_values.map do |value|
      character_map[value]
    end
    final_message.join
  end
end

d = Decryptor.new("xlprbifg7wwdxlprbiw0yvbocice0yheu", 94801, 161215)
d.find_message_character_values
d.split_character_value_into_groups_of_four
d.subtract_final_decryptor_values
d.convert_values_to_characters
