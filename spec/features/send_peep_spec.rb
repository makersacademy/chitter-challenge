require_relative './helper'
require 'peep'

feature "a user can send peeps" do
  scenario "after signing up, a user is prompted to send their first peep" do
    sign_up
    expect(page).to have_button 'Yep, let\'s do it!'
  end

  scenario "a user can post a peep" do
    sign_up
    click_button 'Yep, let\'s do it!'
    fill_in 'peep_content', with: "My first peep"
    click_button 'Tell the world'
    expect(page).to have_content "My first peep"
  end
end