require 'spec_helper'

feature 'Peeping' do
  scenario 'a user is able to post a peep' do
    visit '/peeps/new'
    fill_in "name", with: "Scott"
    fill_in "username", with: "ScottyStarburst"
    fill_in "content", with: "TEST"
    click_button "Post"
    expect(current_path).to eq '/peeps/peeplist'
  end

  scenario 'there are no peeps to begin with' do
    expect(Peep.count).to eq 0
  end

  scenario 'I can post a new peep' do
    sign_up
    visit '/peeps/new'
    fill_in 'Content', with: "HELLO"
    click_button 'Post'
      expect(current_path).to eq '/peeps/peeplist'
    within 'ul#peeps' do
      expect(page).to have_content("HELLO")
    end
  end
end
