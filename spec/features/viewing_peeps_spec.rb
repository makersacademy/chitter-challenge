require_relative '../../App/Models/Peep'

feature 'Viewing Peeps' do

    scenario 'I can see peeps on the peeps page'  do
      Peep.create(message: 'Test text')
      visit '/peeps'
      expect(page.status_code).to eq 200

      within 'ul#peeps' do
        expect(page).to have_content('Test text')
      end
    end
end
