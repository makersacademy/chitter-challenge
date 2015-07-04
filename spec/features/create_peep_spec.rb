feature 'Posting a peep' do
  scenario 'I can post a peep' do
    sign_up
    sign_in
    visit '/peeps'
    click_button('New peep')
    expect(page).to have_content 'Enter your peep here'
  end

  scenario 'My peep appears in the list' do
    sign_up
    sign_in
    visit '/peeps'
    click_button('New peep')
    fill_in 'peep',  with:'My status update'
    click_button('Post now')
    expect(page).to have_content 'My status update'
    within 'ul#peeps' do
      expect(page).to have_content 'kj'
    end
  end

  scenario 'I cannot post a new peep if I have not logged in' do
    visit '/peeps'
    click_button('New peep')
    fill_in 'peep', with: 'Any message'
    click_button('Post now')
    expect(page).to have_content 'Please sign in first'
  end
end
