require './app/models/maker'

describe Maker do

  let(:maker) { Maker.first }

  it "saves a password recovery token when we generate a token" do
    sign_up
    Capybara.reset!
    expect{maker.generate_token}.to change{maker.password_token}
  end

  it 'can find a user with a valid token' do
   maker.generate_token
   expect(Maker.find_by_valid_token(maker.password_token)).to eq maker
 end
end
