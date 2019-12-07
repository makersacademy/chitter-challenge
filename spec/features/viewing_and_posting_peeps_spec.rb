feature 'Posting peeps' do
  context 'posting one peep' do

    before(:each) do
      visit '/peeps'
      click_button 'Peep'

      expect(current_path).to eq('/peeps/new')
      fill_in 'message', with: 'First peep'
      click_button 'Peep'
    end

    scenario 'see the peep' do
      expect(current_path).to eq('/peeps')
      expect(page).to have_content('First peep')
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

  end

end
