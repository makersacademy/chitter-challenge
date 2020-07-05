feature 'posting a peep' do  
    scenario 'posted peep is shown on the view peeps page' do
      visit('/')
      click_link('Add Peep')
      fill_in('message', with: 'Test Peep')
      click_button('Post Peep')
      click_link('View Peeps')
      expect(page).to have_content('Test Peep')
    end  
end
