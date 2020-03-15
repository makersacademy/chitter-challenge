feature 'creating new peep' do
    scenario 'a peep can be creaeted' do
      visit 'users/new'
      fill_in('username', with: 'RichardPizzle')
      fill_in('email', with: 'richard.fake@gmail.com')
      fill_in('name', with: 'Richard Pattinson')
      click_button('Submit')
      expect(page).to have_content('RichardPizzle')
      click_button('Post Peep')
      fill_in('content', with: 'Oil prices are too high')
      click_button('Submit')
      expect(page).to have_content('Oil prices are too high')
    end
end