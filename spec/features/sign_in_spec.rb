require 'spec_helper'
require 'web_helpers'

feature 'Signing in' do
  scenario 'A user can log in to homepage if enter correct credentials' do
    sign_in
    expect(page).to have_content('Welcome back, James')
  end

  scenario 'A user returns to sign in page if entered incorrect credentials' do
    incorrect_sign_in
    expect(page.current_path).to eq('/users')
  end
end
