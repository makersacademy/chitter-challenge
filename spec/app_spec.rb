require_relative '../app/app.rb'

describe Chitter do
  subject(:app) {described_class.new}
  it{is_expected.to respond_to(:current_user)}
  it{is_expected.to respond_to(:helpers)}
end
