require 'user'

RSpec.describe User do
  it 'constructs' do
    User.create('Penelope Heart', 'penel<3@makers.com', 'penelopeheartsyou', 'SweetHeart321')
    expect(User.username).to eq 'penelopeheartsyou'
  end

  it 'contructs and returns a different username' do
    User.create('John Heart', 'penel<3@makers.com', 'john333', 'SweetHeart321')
    expect(User.username).to eq 'john333'
  end

  it 'returns a name' do
    User.create('Penelope Heart', 'penel<3@makers.com', 'penelopeheartsyou', 'SweetHeart321')
    expect(User.name).to eq 'Penelope Heart'
  end  

  it 'returns a different name' do
    User.create('John Pie', 'penel<3@makers.com', 'penelopeheartsyou', 'SweetHeart321')
    expect(User.name).to eq 'John Pie'
  end

  it 'returns the name linked to a username' do
    User.create('Penelope Heart', 'penel<3@makers.com', 'penelopeheartsyou', 'SweetHeart321')
    expect(User.return_name_for_username("penelopeheartsyou")).to eq 'Penelope Heart'
  end
end
