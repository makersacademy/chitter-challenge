require 'spec_helper'

feature "A user can sign up" do

  scenario "can create a user" do
    expect{sign_up}.to change{User.count}.from(0).to(1)
  end

  scenario "a user can't sign up with a blank email" do
    expect{sign_up(email: "")}.not_to change{User.count}
  end

  scenario "a user can't sign up with an invalid email" do
    expect{sign_up(email: "isabel@g")}.not_to change{User.count}
  end
end
