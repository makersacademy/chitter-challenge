require 'spec_helper'

feature 'Posting peeps' do
  scenario 'user can access the posting page once logged in' do
    sign_up(username: 'Batman', email: 'bruce@wayne.com', password: 'loverobin', password_confirmation: 'loverobin')
    log_in(username:'Batman', password: 'loverobin')
    click_button('Peep')
    expect(page).to have_content('Compose new Peep')
  end

  scenario 'user can post a peep' do
    visit('/peeps/new')
    fill_in 'content', with: 'Post something'
    click_button 'Peep'
    expect(current_path).to eq('/peeps')
    within 'ul#peeps' do
      expect(page).to have_content("Post something")
    end
  end
end