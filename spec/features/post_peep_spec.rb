feature 'Logged-in user can post a peep' do
  scenario 'Logged in user can post a peep' do
    sign_up
    click_button 'Add peep'
    fill_in :message, with: 'Hello!'
    click_button 'Peep!'
    expect(page).to have_content 'Hello!'
  end

  scenario 'Users not logged in redirected to log in page' do
    visit '/chitter-feed/new'
    fill_in :message, with: 'Hello!'
    click_button 'Peep!'
    expect(page).not_to have_content 'Hello!'
    expect(page.current_path).to eq '/session/new'
  end
end
