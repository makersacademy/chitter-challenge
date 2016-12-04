require 'spec_helper'

feature 'welcome page' do
  scenario 'the user sees a customized welcome message' do
    visit '/welcome'
    expect(page).to have_content "Welcome vero@test.com to Chitter, now you can start!"
  end
end
