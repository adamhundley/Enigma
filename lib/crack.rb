require_relative 'decryptor'

class Crack
  attr_reader :message, :ending, :character_map

  def initialize(message, _date)
    @message = message.chars
    @ending = "..end..".chars
    @character_map = create_character_map
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

  def count_in
    message.size % 4
  end

  def encrypted_character_values_of_the_end
    message_values = find_message_character_values
    message_values.pop(count_in)
    message_values[-4..-1]
  end

  def crack_cipher_character_values
    ending.map do |character|
      create_character_map.index(character)
    end
  end

  def find_abcd_values
    abcd_values = crack_cipher_character_values
    abcd_values.pop(count_in)
    abcd_values[-4..-1]
  end

  def determine_rotation_values
    abcd_message = encrypted_character_values_of_the_end
    abcd_ending = find_abcd_values
    [abcd_ending, abcd_message].transpose.map do |value|
      if value[0] > value[1]
        (38 - value[0]) + value[1] + 1
      else
        value[1] -= value[0]
      end
    end
  end

  def key_a
    determine_rotation_values[0]
  end

  def key_b
    determine_rotation_values[1]
  end

  def key_c
    determine_rotation_values[2]
  end

  def key_d
    determine_rotation_values[3]
  end

  def subtract_final_crack_values
    final_crack_values = []
    character_value_into_groups_of_four.each do |group|
      group.each_with_index do |value, index|
        if index == 0
          a_final_value = value - key_a
          final_crack_values << a_final_value % 39
        elsif index == 1
          b_final_value = value - key_b
          final_crack_values << b_final_value % 39
        elsif index == 2
          c_final_value = value - key_c
          final_crack_values << c_final_value % 39
        elsif index == 3
          d_final_value = value - key_d
          final_crack_values << d_final_value % 39
        end
      end
    end
    final_crack_values
  end

  def convert_values_to_characters
    final_crack = subtract_final_crack_values.map do |value|
      character_map[value]
    end
    final_crack.join
  end
end
# #
# c = Crack.new("lxwc2y6u5n71k9mv93rv3", 000000)
# c.find_message_character_values
# c.count_in
# c.encrypted_character_values_of_the_end
# c.crack_cipher_character_values
# c.find_abcd_values
# c.determine_rotation_values
# c.key_a
# c.key_b
# c.key_c
# c.key_d
# c.subtract_final_crack_values
# c.convert_values_to_characters
