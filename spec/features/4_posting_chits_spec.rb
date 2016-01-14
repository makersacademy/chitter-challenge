feature 'User Posts Chits' do
  feature 'Logged in' do
    scenario '' do
      user_sign_up
      fill_in('chit_text', with: 'Hello :)')
      click_button('Chit!')
      expect(page).to have_content('Hello :)')
    end
  end

  feature 'Not logged in' do

  end
end
