require './lib/peep'

feature Peep do

  describe '.add' do
    it 'should add a peep to the stored peeps' do
      visit('/peeps')
      fill_in 'string', with: 'The night I lost CTRL'
      click_button 'Peep it'
      expect(page).to have_content('The night I lost CTRL')
    end
  end

end
