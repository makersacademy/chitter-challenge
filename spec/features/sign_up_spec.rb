require 'spec_helper'

feature 'user can sign up' do
  scenario 'I can sign up as a new user' do
    signup
    expect { click_button('Sign up') }.to change(User, :count).by 1
    expect(page).to have_content('Welcome Erce')
    expect(User.first.email).to eq('erce@erce.com')
  end
end
