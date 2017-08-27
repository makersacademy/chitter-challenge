# So that I can post peeps as me, I want to sign up to chitter

require_relative '../../app/app.rb'
require_relative '../../app/models/user.rb'

feature 'user sign up' do

  scenario 'user signs up with username, name, email address and password' do
    visit '/peeps'
    click_button("Sign up")
    fill_in('name', with: "Olivia")
    fill_in('email', with: "o@makers.com")
    fill_in('username', with: "frosty")
    fill_in('password', with: "olivia")
    expect(User).to receive(:create).with(name: 'Olivia', username: 'frosty', email: 'o@makers.com', password: 'olivia')
    click_button("Complete Signup")
  end

end
