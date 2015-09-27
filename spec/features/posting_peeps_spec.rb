require 'spec_helper'

feature 'Posting Peeps' do
  scenario 'I have to be signed in to post a peep' do
    visit '/peep'
    expect(page).not_to have_selector('Post')
  end

  scenario 'I can create a new peep when signed in' do
    user = create :user
    sign_in(user)
    visit '/peep/new'
    fill_in 'content',   with: 'Hello World!'
    click_button 'Post'
    expect(current_path).to eq '/peep'
    within 'ul#peep' do
      expect(page).to have_content('Hello World!')
    end
  end
end
