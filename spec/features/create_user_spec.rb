feature 'creating new user' do
    scenario 'a user can be creaeted' do
      visit 'users/new'
      fill_in('username', with: 'RichardPizzle')
      fill_in('email', with: 'richard.fake@gmail.com')
      fill_in('name', with: 'Richard Pattinson')
      click_button('Submit')
      expect(page).to have_content('RichardPizzle')
    end
  end
  