require_relative '../app/models/user.rb'

describe User do
  subject(:user) {described_class.new}
  it{is_expected.to respond_to(:name)}
end
