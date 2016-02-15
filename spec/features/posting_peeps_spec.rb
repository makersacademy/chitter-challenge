require 'spec_helper'

feature 'Post Peeps' do
  scenario 'a user is able to post a peep' do
    sign_up
    visit '/peeps/new'
    expect(page.status_code).to eq 200
    fill_in "content", with: "I am posting a test peep"
    click_button "Post peep"
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('I am posting a test peep')
  end

  scenario 'a user cannot post peeps if not signed in' do
    visit '/'
    expect(page).not_to have_content "Post peep"
  end

end
