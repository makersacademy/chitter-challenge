require_relative './helpers/sign_in.rb'

feature "User log out" do

  include SignIn

  scenario "a logged in user can completely log out" do
    sign_in('test@test.com', 'test')
    click_button "Log out"
    expect(page).to have_content "You are signed out"
  end

  scenario "once signed out you must sign in again" do
    sign_in('test@test.com', 'test')
    click_button "Log out"
    visit '/peeps'
    expect(page).to have_content "Please sign in"
  end



end