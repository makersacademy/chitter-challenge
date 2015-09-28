require_relative '../../App/Models/Peep'

feature 'Viewing Peeps' do

  include Helpers

    scenario 'I can see existing peeps on the peeps page'  do
      user = create(:user)
      sign_in(user)
      peep = Peep.new(id: 1, message: 'Test text')
      peep.user = user
      peep.save
      visit '/peeps'
      expect(page.status_code).to eq 200
      within 'ul#peeps' do
        expect(page).to have_content('Test text')
      end
    end
end
