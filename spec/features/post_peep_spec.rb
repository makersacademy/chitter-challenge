feature 'Post peep' do
  scenario '> can submit string as a peep to the feed' do
    sign_up_correctly
    click_button 'Add peep'
    fill_in :message, with: 'Hello World!'
    click_button 'Peep Away!'
    within 'ul#peeps' do
      expect(page).to have_content 'Hello World!'
    end
  end

  scenario '> cannot submit peep if not logged in' do
    visit '/chitter_feed/new'
    fill_in :message, with: 'Hello World!'
    click_button 'Peep Away!'
    expect(page).to have_content "Log in to peep!"
  end
end
