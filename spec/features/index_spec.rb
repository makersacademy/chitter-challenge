require 'spec_helper'

feature 'chitter homepage' do
  scenario 'user can click through to sign up/log in' do
    visit '/'
    expect(page).to have_content("Click here to sign up.")
    expect(page).to have_content("Click here to log in.")
  end
end
