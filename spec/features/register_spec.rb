feature 'register' do

  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter
  scenario 'I can register as a new user' do
    expect(User.first.username).to eq('elchapo91')
  end





end
