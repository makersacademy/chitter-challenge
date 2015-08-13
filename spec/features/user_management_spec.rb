require "spec_helper"

feature "user signing up" do
  scenario "can sign up if all ok" do
    expect { sign_up(user) }.to change(User :count).by 1
  end



  def sign_up(user)
    visit "/"
    click_link "Sign up"
    fill_in "name", with: user.name
    fill_in "email", with: user.email
    fill_in "username", with: user.username
    fill_in "password", with: user.password
    fill_in "password_confirmation", with: user.password_confirmation
    click_button "Sign up"
  end 
end