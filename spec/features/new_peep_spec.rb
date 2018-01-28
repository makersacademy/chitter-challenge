feature 'user can add a new peep' do
  scenario 'user creates new peep and it appears on peeps page' do
      visit '/'
      click_button 'new_peep'
      fill_in 'body', with: 'new peep created' 
      fill_in 'author', with: 'satoshi'
      click_button 'post'

      expect(page).to have_content('new peep created')
  end
end
