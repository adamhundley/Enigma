class Crack
  attr_reader :message, :ending

  def initialize(message, date = Time.new.strftime("%d""%m""%y"))
    @message = message.chars
    @date = date.to_i
    @ending = "..end..".chars
    create_character_map
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

  def count_in
    message.size % 4
  end

  def encrypted_character_values_of_the_end
    message_values = find_message_character_values
    message_values.pop(count_in)
    message_values[-4..-1]
  end

  def crack_character_values
    ending.pop(count_in)
    abcd_characters = [ending[-4..-1]]
    abcd_characters.map do |character|
      create_character_map.index(character)
    end
  end

  def subtract_character_values_from_39
    crack_character_values.map do |character|
      39 - character
    end
  end

  def add_encrypted_values_to_subtracted_values
    addition = [subtract_character_values_from_39,
      encrypted_character_values_of_the_end].transpose.map do |value|
      value.reduce(:+)
    end
  end

  def subtract_date_from_values
    date = [6,2,2,5,6,2,2]
    subtraction = [add_encrypted_values_to_subtracted_values, date].transpose.map do |value|
      value.reduce(:-)
    end
  end
end

# rotations = [keys, offsets].transpose.map {|rotation| rotation.reduce(:+)}
c = Crack.new("pojeuod")
c.find_message_character_values
c.encrypted_character_values_of_the_end
c.crack_character_values
c.subtract_character_values_from_39
# c.add_encrypted_values_to_subtracted_values
# c.subtract_date_from_values
# c.find_abcd_position_in_message
# find_message_character_values
