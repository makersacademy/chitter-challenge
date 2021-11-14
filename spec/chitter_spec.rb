feature 'A user can create a tweet' do
  scenario 'A user goes to the site, types out their tweet and see a page with the tweet posted.' do
    visit("/")
    fill_in 'tweet', with: 'My first tweet.'
    click_button 'Tweet!'
    expect(page).to have_content('My first tweet.')
  end
end