describe 'Chitter Feature' do

  feature 'Visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'
      expect(page.status_code).to eq(200)
      expect(page).to have_content('Chitter')
    end
    
    scenario 'the user can type in a new message' do
      visit '/'
      fill_in('new_peep', with: 'THIS IS A TEST PEEP')
      click_button('Submit')
      expect(page).to have_content('THIS IS A TEST PEEP')
    end
  end
end
