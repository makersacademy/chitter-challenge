feature 'I want to post a message (peep) to chitter' do

  let(:peep_content){'The quick brown fox jumped over the lazy dog'}

  scenario 'Logged in user can peep' do
    sign_up
    sign_in(SessionHelpers::EMAIL, SessionHelpers::PASSWORD)
    click_button('Create Peep')
    fill_in('peep_content', with: peep_content)
    click_button("Save")
    expect(page).to have_content peep_content
  end
  scenario 'User who is not logged in cannot peep' do

    visit '/peeps'
    click_button('Create Peep')
    expect(page).not_to have_content peep_content
    expect(page).to have_content('You must be logged in to peep')
  end
end
