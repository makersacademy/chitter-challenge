RSpec::Matchers.define :eq_with_different_objects do |expected|
  match do |actual|
    actual ==(expected)
  end

  def ==(other)
    actual.title == other.title
  end
end
