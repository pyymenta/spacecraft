# frozen_string_literal: true

Expector = Struct.new(:actual) do
  def to(functor)
    functor.call(actual)
  end
end

def it(doc)
  result = yield

  p result ? "." : "#{doc}: #{result}"
end

def expect(value)
  Expector.new(value)
end

def eq(expected)
  ->(actual) do
    result = actual == expected

    p "actual: #{actual}, expected: #{expected}" unless result

    result
  end
end
