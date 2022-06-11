require 'user'

RSpec.describe User do
  it 'constructs' do
    user = User.new('Penelope Heart', 'penel<3@makers.com', 'penelopeheartsyou', 'SweetHeart321')
    expect(user.name).to eq 'Penelope Heart'
    expect(user.email).to eq 'penel<3@makers.com'
    expect(user.username).to eq 'penelopeheartsyou'
    expect(user.password).to eq 'SweetHeart321'
  end
end