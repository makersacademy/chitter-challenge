require_relative './helpers/sign_in.rb'

feature "User log out" do

  include SignIn

  before(:each) do
    User.create(:email => "mrTex@test.com",
                 :user_name => "SuperMan",
                 :name => "Jimbo Jones",
                 :password => 'TedTex',
                 :password_confirmation => 'TedTex')
  end

  scenario "a logged in user can completely log out" do
    sign_in
    expect(page).to have_content  "Enter Peep:"
    click_button "Sign out"
    expect(page).to have_content "You are signed out"
  end

  scenario "logged out users cannot post peeps" do
    sign_in
    click_button "Sign out"
    visit '/peeps'
    expect(page).to have_content "Enter Peep"
  end



end