require 'pg'

feature "displays all peeps on the homepage" do
  scenario "user can see all peeps on the homepage" do
      connection = PG.connect(dbname: 'chitter_test')
      visit('/')
      fill_in('content', with: 'This is a peep')
      click_button('Post Peep')

      expect(page).to have_content('This is a peep')
    end
end
