class RandomRef

  CHARS = *'A'..'Z', *'0'..'9'

  attr_reader :string

  alias to_s string

  def initialize(length: 10)
    @string = length.times.map { CHARS.sample }.join
  end

end
