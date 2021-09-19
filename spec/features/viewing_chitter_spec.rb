require 'pg'

feature 'viewing the chitter page' do 
  scenario 'user able to visit the chitter main page' do
    visit ('/chitter') 
    expect(page).to have_content "Chitter"
  end
end

feature 'Viewing chitter posts' do
    scenario 'A user can see all chitter posts' do
      connection = PG.connect(dbname: 'chitter_app_test')
  
      # Add the test data
      connection.exec("INSERT INTO chitter (post) VALUES ('This is my first Chitter post!');")
      connection.exec("INSERT INTO chitter (post) VALUES ('This is my second Chitter post!');")
      connection.exec("INSERT INTO chitter (post) VALUES ('This is my third Chitter post!');")

      visit('/chitter')
  
      expect(page).to have_content "This is my first Chitter post!"
      expect(page).to have_content "This is my second Chitter post!"
      expect(page).to have_content "This is my third Chitter post!"
    end
  end