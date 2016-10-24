require 'spec_helper'

feature "logging out" do
  scenario "forgets you" do
    visit '/'
    click_button 'Log out'
    expect(page).not_to have_content("Hi Bubbles")
  end
end
