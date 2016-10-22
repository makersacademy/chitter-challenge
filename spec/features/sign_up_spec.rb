require 'spec_helper'

feature 'sign up form' do
  scenario 'users can sign up' do
    sign_up
    # expect(page).to have_content('Welcome Elizabeth!')
    expect(User.first.name).to eq('Elizabeth')
  end
end
