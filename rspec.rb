# frozen_string_literal: true

Expector = Struct.new(:actual) do
  def to(functor)
    functor.call(actual)
  end
end

def it(doc)
  result = yield

  p("#{doc}: #{result}") unless result
end

def expect(value)
  Expector.new(value)
end

def eq(expected)
  ->(actual) do
    (actual == expected).tap do |result|
      p("actual: #{actual}, expected: #{expected}") unless result
    end
  end
end
