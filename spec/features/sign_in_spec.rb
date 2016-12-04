require 'spec_helper'
require 'web_helpers'

feature 'Signing in' do
  scenario 'A user can log in to homepage if enter correct credentials' do
    sign_in
    expect(page).to have_content('Welcome back, James')
  end
end
