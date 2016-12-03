require 'spec_helper'

feature "A user can sign up" do

  scenario "can create a user" do
    expect{sign_up}.to change{User.count}.from(0).to(1)
  end
end
