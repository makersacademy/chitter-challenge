require 'web_helper'

feature "User sign up" do

  scenario 'adds new user to db' do
    user_signup
    expect{click_button 'Sign up'}.to change(User, :count).by(1)
  end

end
