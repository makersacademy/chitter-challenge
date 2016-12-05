require './app/app.rb'
require './app/models/user.rb'

feature "User log in" do

  scenario "Requires the password to match confirmation password" do
    visit '/signup'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password'
    click_button 'submit'
    visit '/signin'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password'
    expect{(click_button 'submit')}.not_to change(User, :count)
  end

end
