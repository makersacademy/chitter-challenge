require_relative 'web_helper'

RSpec.feature 'Sign Up' do
  scenario 'User can sign up' do
    sign_up
    click_on 'Log out'
    expect(page.current_path).to eq('/')
  end
end
