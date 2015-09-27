feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps'
    click_button 'Sign in'
    user = create(:user)
    sign_in(user)
    click_button 'New peep'
    fill_in 'content',   with: 'First peep'
    click_button 'Peep!'

    # we expect to be redirected back to the links page
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('First peep')
    end
  end

    scenario 'cant post peep if not signed in' do
      visit '/peeps'
      click_button 'New peep'
      expect(page).to have_content('You must sign in to peep')
    end

end
