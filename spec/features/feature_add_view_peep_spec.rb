
feature 'Adding and viewing peeps' do
  feature 'a user can add and then view a peep' do
    scenario 'a peep is added for a user' do
      visit '/users/user_new'
      click_button('Write a peep')
      expect(current_path).to eq "/peeps/#{user.id}/peep_new"
      fill_in 'text', with: 'This is a test peep for this user'
      click_button('Post Peep')
      expect(current_path).to eq '/peeps'
      expect(page).to have_content 'This is a test peep for this user'
    end
  end
end
