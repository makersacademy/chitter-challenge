require_relative 'web_helper'

RSpec.feature 'Sign Up' do
  scenario 'User can sign up' do
    sign_up
    expect(page.current_path).to eq('/profile')
    expect(page).to have_content 'Welcome myusername'
  end
end
