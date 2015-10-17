require_relative '../../lib/models/peep'

feature 'Viewing peeps' do

    scenario 'The peeps can be seen'  do

      visit '/users/new'
      save_and_open_page
      fill_in :email, with: "dave@me.com"
      fill_in :username, with: "dave"
      fill_in :password, with: "password123"
      fill_in :password_confirmation, with: "password123"
      click_button 'Sign up'
      fill_in "message", with: 'Test text'
      click_button 'Create Peep'
      expect(current_path).to eq '/peeps'
      expect(page.status_code).to eq 200

      within 'ul#peeps' do
        expect(page).to have_content('Test text')
      end
    end
end
