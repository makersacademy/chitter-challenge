require 'spec_helper'
# require '../../app/helpers/current_user'

feature 'Post Peeps' do
  scenario 'a user is able to post a peep' do
    sign_up
    visit '/peeps/new'
    expect(page.status_code).to eq 200
    fill_in "content", with: "I am posting a test peep"
    click_button "Post peep"
    expect(current_path).to eq '/peeps'


    within 'ul#peeps' do
      expect(page).to have_content('I am posting a test peep')
    end

  end


    scenario 'a user cannot post peeps if not signed in' do
    end

end
