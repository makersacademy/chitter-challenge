require 'spec_helper'

feature 'User sign in' do
  scenario 'with correct credentials' do
    user = create(:user)
    sign_in(user)
    expect(page).to have_content("Signed in as #{user.username}")
  end

  scenario 'I can not sign in with incorrect credentials' do
    user = build(:user)
    sign_in(user)
    expect(page).to have_content('Your login information is incorrect')
  end
end