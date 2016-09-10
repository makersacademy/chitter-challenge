require 'spec_helper'

feature 'User Sign Out' do
  scenario 'User signs out' do
    sign_up
    visit '/'
    click_link 'Sign Out'
    expect(page).to have_content('Goodbye, Chit Ter')
    expect(page).not_to have_content('Post Cheet')
  end
end
