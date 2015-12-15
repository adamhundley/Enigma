class RotationGenerator
  attr_accessor :date, :key  # => nil

  def initialize(key, date)
    @key = key.to_s          # => "11425"
    @date = date.to_i        # => 141215
    date_offset              # => "19941676225"
  end

  def a_key_rotation
    @key[0..1].to_i   # => 11
  end

  def b_key_rotation
    @key[1..2].to_i   # => 14
  end

  def c_key_rotation
    @key[2..3].to_i   # => 42
  end

  def d_key_rotation
    @key[3..4].to_i   # => 25
  end

  def date_offset
    (@date ** 2).to_s  # => "19941676225", "19941676225", "19941676225", "19941676225", "19941676225"
  end

  def a_rotation
    a_key_rotation + date_offset[-4].to_i  # => 17
  end

  def b_rotation
    b_key_rotation + date_offset[-3].to_i  # => 16
  end

  def c_rotation
    c_key_rotation + date_offset[-2].to_i  # => 44
  end

  def d_rotation
    d_key_rotation + date_offset[-1].to_i  # => 30
  end

end

# r = RotationGenerator.new(11425, 141215)  # => #<RotationGenerator:0x007fcc9c06b0d8 @key="11425", @date=141215>
# r.a_rotation                              # => 17
# r.b_rotation                              # => 16
# r.c_rotation                              # => 44
# r.d_rotation                              # => 30
