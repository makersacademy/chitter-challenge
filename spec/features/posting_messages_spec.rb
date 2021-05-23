feature 'posting messages' do
  context 'when signed in' do
    scenario 'a message is added' do
      register_new_user
      fill_in(:peep, with: 'This is a message')
      click_button('Post')
      expect(page).to have_content('This is a message')
    end
  end

  context 'when not signed in' do
    scenario 'cannot post messages' do
      visit('/')
      expect(page).to have_content('Sign in to post a message')
      expect(page).not_to have_content('Add Message:')
    end
  end
end
