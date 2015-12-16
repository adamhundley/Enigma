class RotationGenerator
  attr_accessor :date, :key  # => nil

  def initialize(key, date)
    @key = key.to_s          # => "69542"
    @date = date             # => 141215
    date_offset              # => "19941676225"
  end

  def date_offset
    (@date.to_i ** 2).to_s  # => "19941676225", "19941676225", "19941676225", "19941676225", "19941676225"
  end

  def a_key_rotation
    @key[0..1].to_i   # => 69
  end

  def b_key_rotation
    @key[1..2].to_i   # => 95
  end

  def c_key_rotation
    @key[2..3].to_i   # => 54
  end

  def d_key_rotation
    @key[3..4].to_i   # => 42
  end

  def a_rotation
    a_key_rotation + date_offset[-4].to_i  # => 75
  end

  def b_rotation
    b_key_rotation + date_offset[-3].to_i  # => 97
  end

  def c_rotation
    c_key_rotation + date_offset[-2].to_i  # => 56
  end

  def d_rotation
    d_key_rotation + date_offset[-1].to_i  # => 47
  end
end

r = RotationGenerator.new(69542, 141215)  # => #<RotationGenerator:0x007fd85c142170 @key="69542", @date=141215>
r.a_rotation                              # => 75
r.b_rotation                              # => 97
r.c_rotation                              # => 56
r.d_rotation                              # => 47
