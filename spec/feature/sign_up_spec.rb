require 'pry'

feature 'Signing up' do
  it 'Allows you to sign up for Chitter' do
    visit '/'
    click_button 'Sign Up'
    fill_in(:name, with: 'Amy')
    fill_in(:username, with: 'AmelieSK')
    fill_in(:email, with: 'adp@gmail.com')
    fill_in(:password, with: 'smth')
    expect(page).to have_content "Sign up for Chitter"
    truncate_db
  end
end
