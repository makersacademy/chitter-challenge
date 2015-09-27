require_relative '../../lib/models/peep'

feature 'Viewing peeps' do

    scenario 'The peeps can be seen'  do
      Peep.create(message: 'Test text')
      visit '/peeps'
      expect(page.status_code).to eq 200

      within 'ul#peeps' do
        expect(page).to have_content('Test text')
      end
    end
end
