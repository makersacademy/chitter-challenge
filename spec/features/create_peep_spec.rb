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
  end
end
