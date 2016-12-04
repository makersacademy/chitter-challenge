require_relative '../../app/models/user'
require_relative 'web_helper'

RSpec.feature 'Sign up' do
  scenario 'A user can use sign up form' do
    sign_up
    expect(current_path).to eq '/'
  end

  scenario 'After sign up user gets a welcome message' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter'
  end


end
