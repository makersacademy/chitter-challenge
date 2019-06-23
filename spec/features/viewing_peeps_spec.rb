require 'pg'

feature 'VIEWING PEEPS' do
  feature 'visiting the homepage' do
    scenario 'visiting the index page' do
      visit '/'
      expect(page).to have_content "Chitter"
    end
  end

  feature 'viewing peeps' do
    scenario 'a user can see all peeps' do

      Peep.create(username: "johndoe", text: "This is the first peep")
      Peep.create(username: "johndoe", text: "This is the second peep")
      Peep.create(username: "johndoe", text: "This is the third peep")

      visit '/peeps'
      
      expect(page).to have_content("johndoe", "This is the first peep")
      expect(page).to have_content("johndoe", "This is the second peep")
      expect(page).to have_content("johndoe", "This is the third peep")
    end
  end
end