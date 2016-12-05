require 'spec_helper'

feature "Email validation" do
  include Helpers
  scenario "I can't sign up without a proper email format" do
    wrong_email_sign_up
    expect{wrong_email_sign_up}.to_not change(User, :count)
    expect(page.current_path).to eq('/sign_up')
  end

  scenario "I can't sign up twice with the same email address" do
    def sign_up_same_email
      visit '/sign_up'
      fill_in 'name', with: "Maker Star"
      fill_in 'email', with: "maker@gmail.com"
      fill_in 'username', with: "maker"
      fill_in 'password', with: "54321"
      click_button 'Sign up'
    end
    sign_up
    expect{sign_up_same_email}.to_not change(User, :count)
  end
end
