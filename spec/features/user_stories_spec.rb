# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up' do
  scenario 'user can create an account' do
    visit '/'
    click_button 'Sign up'
    fill_in :name, with: 'Vicky ledsom'
    fill_in :username, with: 'ledleds'
    fill_in :email, with: 'vicky@makers.co.uk'
    fill_in :password, with: '1234'
    click_button 'Create account'

    User.create(name: 'Vicky Ledsom', username: 'ledleds', email: 'vicky@makers.co.uk', password: '1234')
    expect(User.first.email).to eq('vicky@makers.co.uk')
  end
end
