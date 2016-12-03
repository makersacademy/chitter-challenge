require 'spec_helper'


feature "when logging in" do
  before(:each) do
    User.create(name: "Isabel",
                user_name: "Isabel",
                email: 'isabel@example.com',
                password: 'test',
                password_confirmation: 'test')
  end


  scenario "A user will be able to log in with ncorrect password" do
    sign_up
    visit("/log-in")
    fill_in("user_name", :with => "Isabel")
    fill_in("password", :with => "test")
    click_button("Log in")
    expect(page).to have_content("Welcome Isabel")
  end

  scenario "A user will not be able to log in with incorrect password" do
    sign_up
    visit("/log-in")
    fill_in("user_name", :with => "Isabel")
    fill_in("password", :with => "rest")
    click_button("Log in")
    expect(page).to have_content("Wrong password")
  end

  scenario "A user will be able to log out" do
    log_in
    click_button("Log out")
    expect(page).to have_content("Goodbye")
  end

  # scenario "A user will be able to recover a password" do
  #
  #   visit("/log-in")
  #   click_link("Forgotten password?")
  #   fill_in("email", :with => "isabel@example.com")
  #   click_button("Generate new password")
  #   expect(page).to have_content("An email with a confirmation token has ben sent to your inbox")
  # end
end
