# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up' do
  scenario 'user can create an account' do
    sign_up
    User.create(name: 'Vicky Ledsom', username: 'ledleds', email: 'vicky@makers.co.uk', password: '1234')
    expect(User.first.email).to eq('vicky@makers.co.uk')
  end

  scenario 'requires passwords to match' do
    expect{incorrect_sign_up_password}.not_to change(User, :count)
  end
end
