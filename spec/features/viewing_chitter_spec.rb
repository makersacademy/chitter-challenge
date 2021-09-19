require 'pg'

feature 'viewing the chitter page' do 
  scenario 'user able to visit the chitter main page' do
    visit ('/chitter') 
    expect(page).to have_content "Chitter"
  end
end

feature 'Viewing chitter posts' do
    scenario 'user can see all chitter posts' do
      connection = PG.connect(dbname: 'chitter_app_test')
  
      # Refactored adding to test data, using .create
      Chitter.create(post: "This is my first Chitter post!")
      Chitter.create(post: "This is my second Chitter post!")
      Chitter.create(post: "This is my third Chitter post!")
    
      visit('/chitter')
  
      expect(page).to have_content "This is my first Chitter post!"
      expect(page).to have_content "This is my second Chitter post!"
      expect(page).to have_content "This is my third Chitter post!"
    end
  end