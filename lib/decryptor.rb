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

  def subtract_final_decryptor_values   # rotations = [keys, offsets].transpose.map {|rotation| rotation.reduce(:+)}
    final_decryptor_values = []
    character_value_into_groups_of_four.each do |group|
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
        else index == 3
          d_final_value = value - rotation.d_rotation
          final_decryptor_values << d_final_value % 39
        end
      end
    end
    final_decryptor_values
  end

  def convert_values_to_characters
    subtract_final_decryptor_values.map do |value|
      create_character_map[value]
    end
  end

  def join_decrypted_characters_to_string
    convert_values_to_characters.join
  end
end

d = Decryptor.new("q0z075v0ptxm719f q mp,pgb6ug8", 30752, 141215)
d.find_message_character_values
d.character_value_into_groups_of_four
d.subtract_final_decryptor_values
d.convert_values_to_characters
d.join_decrypted_characters_to_string
