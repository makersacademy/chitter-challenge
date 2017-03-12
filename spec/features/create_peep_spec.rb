feature 'Creating peeps' do

  scenario 'user can add new peeps' do
    sign_up
    visit '/peeps/add'

      fill_in 'peep_content', with: 'This is a random peep!'
      click_button 'Add peep'

      expect(current_path).to eq '/peeps'

      within 'ul#peeps' do
        expect(page).to have_text('This is a random peep!')
      end

  end
end
