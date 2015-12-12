class RotationGenerator
  attr_accessor :date, :key                                       # => nil
  attr_reader :a_rotation, :b_rotation, :c_rotation, :d_rotation  # => nil

  def initialize(key = rand(0..99999), date = Time.new.strftime("%d""%m""%y"))
    @key = key.to_s                                                             # => "34916"
    @date = date.to_i                                                           # => 121215
  end

  def key_to_four_numbers
    @a_key_rotation = @key[0..1].to_i  # => 34
    @b_key_rotation = @key[1..2].to_i  # => 49
    @c_key_rotation = @key[2..3].to_i  # => 91
    @d_key_rotation = @key[3..4].to_i  # => 16
  end

  def date_offset
    @offset_date = (@date ** 2).to_s  # => "14693076225"
  end

  def a_rotation
    @a_key_rotation + @offset_date[-4].to_i  # => 40
    # 50
  end

  def b_rotation
    # @b_key_rotation + @offset_date[-3].to_i  # => 78
    50            # => 50
  end

  def c_rotation
    # @c_key_rotation + @offset_date[-2].to_i  # => 66
    50            # => 50
  end

  def d_rotation
    # @d_key_rotation + @offset_date[-1].to_i  # => 49
    50            # => 50
  end

  def key_with_date_offset
    @a_rotation = (@a_key_rotation + @offset_date[-4].to_i)
    @b_rotation = (@b_key_rotation + @offset_date[-3].to_i)
    @c_rotation = (@c_key_rotation + @offset_date[-2].to_i)
    @d_rotation = (@d_key_rotation + @offset_date[-1].to_i)
  end
end

r = RotationGenerator.new  # => #<RotationGenerator:0x007fc8010965c0 @key="34916", @date=121215>

r.key_to_four_numbers  # => 16
r.date_offset          # => "14693076225"
r.a_rotation           # => 40
r.b_rotation           # => 50
r.c_rotation           # => 50
r.d_rotation           # => 50
