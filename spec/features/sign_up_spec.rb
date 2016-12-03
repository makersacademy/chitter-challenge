

require './app/app.rb'

feature 'sign up' do
  scenario 'user can sign up for chitter' do
    visit '/sign_up'
    fill_in 'name', with: 'Bob'
    fill_in 'username', with: 'Bobmcbobface'
    fill_in 'email', with: 'bob@bob.com'
    fill_in 'password', with: 'pwd'
    fill_in 'confirm_password', with: 'pwd'
    click_button('Sign up')
    expect(page).to have_content('Welcome, bob@bob.com')

  end

end
