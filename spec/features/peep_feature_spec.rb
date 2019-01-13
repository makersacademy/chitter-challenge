require_relative './web_helper'

RSpec.feature 'Peep' do
  scenario "user create a peep and content of the peep is displayed on the profile page" do
    log_in
    fill_in :content, with: "Hello world!"
    click_button 'Post'
    expect(page).to have_content("Hello world!")
  end

  scenario "content of the peep is displayed on the home page" do
    log_in
    fill_in :content, with: "Hello world!"
    click_button 'Post'
    click_button 'Log out'
    expect(page).to have_content("Hello world!")
  end

end
