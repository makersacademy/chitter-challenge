feature 'Posting peeps' do
  context 'after signing up and peeping a peep' do

    before do
      visit '/peeps'
      click_button 'Sign up'

      fill_in 'email', with: 'samm@makersacademy.com'
      fill_in 'password', with: 'password123'
      fill_in 'name', with: 'Sam Morgan'
      fill_in 'username', with: 'sjmog'
      click_button 'Submit'
    end

    before(:each) do
      click_button 'Peep'

      expect(current_path).to eq('/peeps/new')
      fill_in 'message', with: 'First peep'
      click_button 'Peep'
    end

    scenario 'see the message of the peep' do
      expect(current_path).to eq('/peeps')
      expect(page).to have_content('First peep')
    end

    scenario 'see the timestamp of the peep' do
      expect(current_path).to eq('/peeps')
      expect(page).to have_content('Peeped: ')
    end

    scenario 'see the maker of who peeped the peep' do
      expect(current_path).to eq('/peeps')
      expect(page).to have_content('Sam Morgan')
    end

    scenario 'see the username of who peeped the peep' do
      expect(current_path).to eq('/peeps')
      expect(page).to have_content('By: sjmog')
    end

    scenario 'seeing multiple peeps in reverse chronological order' do
      expect(current_path).to eq('/peeps')
      click_button 'Peep'

      expect(current_path).to eq('/peeps/new')
      fill_in 'message', with: 'Second peep'
      click_button 'Peep'

      expect(current_path).to eq('/peeps')
      expect(page.find('li:nth-child(1)')).to have_content('Second peep')
      expect(page.find('li:nth-child(2)')).to have_content('First peep')

    end

    scenario 'seeing peeps after signing out' do
      click_button 'Sign out'

      expect(current_path).to eq('/peeps')
      expect(page).to have_content('First peep')
      expect(page).to have_content('By: sjmog (Sam Morgan)')
    end

  end

end
