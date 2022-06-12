require 'user'

RSpec.describe User do
  it 'constructs' do
    User.create('Penelope Heart', 'penel<3@makers.com', 'penelopeheartsyou', 'SweetHeart321')
    expect(User.username).to eq 'penelopeheartsyou'
  end
end
