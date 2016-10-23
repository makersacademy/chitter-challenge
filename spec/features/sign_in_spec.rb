require 'spec_helper'

feature "User sign in" do
  let!(:user) do
    User.create(name: "Abigail Johnson", email: 'abigail@gmail.com', user_name: "Ab", password: '1234', password_confirmation: '1234')
  end

  scenario "with correct credentials" do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content("Welcome, #{ user.user_name }")
  end

end
