feature 'add peep' do
  context 'signed in' do
    scenario 'user adds peep' do
      user_sign_in
      visit '/'
      fill_in('peep', with: "Now I've had the time of my life. No, I never felt like this before")
      click_on 'Submit'
      expect(page).to have_content("Now I've had the time of my life. No, I never felt like this before")
    end
  end

  context 'not signed in' do
    scenario 'user cannot add peep' do
      visit '/'
      expect(page).not_to have_content('Create Peep')
    end
  end
end
