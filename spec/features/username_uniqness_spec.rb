require 'spec_helper'

feature 'Unique username' do
  include Helpers
  scenario "I want to sign up witn a unique username" do
    def sign_up_same_username
      visit '/sign_up'
      fill_in 'name', with: "Maker Star"
      fill_in 'email', with: "taker@gmail.com"
      fill_in 'username', with: "maker"
      fill_in 'password', with: "54321"
      click_button 'Sign up'
    end
    sign_up
    expect{sign_up_same_username}.to_not change(User, :count)
    expect(page.current_path).to eq '/sign_up'
  end
end
