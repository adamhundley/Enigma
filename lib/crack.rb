class Crack
  attr_reader :message, :ending

  def initialize(message, date)
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
    ending.map do |character|
      create_character_map.index(character)
    end
  end

  def find_abcd_values
    abcd_values = crack_character_values
    abcd_values.pop(count_in)
    abcd_values[-4..-1]
  end

  def subtract_character_values_from_39
    find_abcd_values.map do |value|
      39 - value
    end
  end

  def add_encrypted_values_to_subtracted_values
    addition = [encrypted_character_values_of_the_end, subtract_character_values_from_39].transpose.map do |value|
      value.reduce(:+)
    end
  end

  def subtract_date_from_values
    date = [6,2,2,5]
    subtraction = [add_encrypted_values_to_subtracted_values, date].transpose.map do |value|
      value.reduce(:-)
    end
  end

  def adjust_values
    subtract_date_from_values.map do |value|
      if value < 10
        value += 39
      else
        value
      end
    end
  end

  def create_key_from_values
    final = adjust_values.join
    key = ""
    key << final[0] << final [1] << final[3] << final[5] << final[7]
    key.to_i
  end
end

c = Crack.new("q0z075v0ptxm719f q mp,pgb6ug8", 141215)
c.find_message_character_values
c.count_in
c.encrypted_character_values_of_the_end
c.crack_character_values
c.find_abcd_values
c.subtract_character_values_from_39
c.subtract_date_from_values
c.add_encrypted_values_to_subtracted_values
c.subtract_date_from_values
c.adjust_values
c.create_key_from_values
