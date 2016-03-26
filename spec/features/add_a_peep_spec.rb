feature 'I want to post a message (peep) to chitter' do

  let(:peep_content){'The quick brown fox jumped over the lazy dog'}

  scenario 'Logged in user can peep, and display  time, username, content' do
    sign_up
    sign_in(SessionHelpers::EMAIL, SessionHelpers::PASSWORD)
    click_button('Create Peep')
    fill_in('peep_content', with: peep_content)
    click_button("Save")
    expect(page).to have_content peep_content
    expect(page).to have_content SessionHelpers::USERNAME
    expect(page).to have_content (/([0-3][0-9]\/){2}201[0-9]\s[0-1][0-9]\:[0-5][0-9][AP]M/)
  end
  scenario 'User who is not logged in cannot peep' do
    visit '/peeps'
    expect(page).not_to have_button('Create Peep')
  end
end
