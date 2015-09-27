require 'spec_helper'

feature 'Signing in' do

  scenario 'can sign in with username and password' do
    user = build(:user)
    sign_in(user)
    expect(page).to have_content "Welcome to Chitter!"
  end

end
