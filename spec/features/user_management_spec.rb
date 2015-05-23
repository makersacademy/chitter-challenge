require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers

feature 'User signs up' do 

  scenario 'when being the user visiting the site' do 
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test@test.com')
    expect(User.first.email).to eq('test@test.com')
  end
end