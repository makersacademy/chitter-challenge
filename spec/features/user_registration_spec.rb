require 'spec_helper'
require 'web_helper'

feature 'registration' do
  scenario 'a user can sign up' do
    sign_in

    expect(page).to have_content 'Welcome, Simona'
  end
end
