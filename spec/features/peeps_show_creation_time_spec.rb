feature 'I can see the time a peep was created' do

    scenario 'User can see the time a peep was created' do
      visit('/') 
      fill_in 'peep_content', with: 'Hello Chitter users!'
      click_button 'Post'

      peep = Peep.all
      peep = peep[0].created_at

      expect(page).to have_content peep
    end
  end
  