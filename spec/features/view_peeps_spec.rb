require 'pg'

feature 'User can visit the home page and read peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
    within(:css, '#buttons') do
      click_link 'Enter'
    end
  end

  feature 'Viewing peeps' do
    scenario 'A user can see a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeplist VALUES(1, 'Gabby', 'gsang', 'hello all', current_timestamp);")
      connection.exec("INSERT INTO peeplist VALUES(2, 'Sonny', 'sonny1', 'hi there', current_timestamp);")
      connection.exec("INSERT INTO peeplist VALUES(3, 'Snake', 'hiss1', 'heya', current_timestamp);")

      # visit('/viewpeeps')
      #
      # expect(page).to have_content("3", "Sonny", "sonny1", "hi there" )
    end
  end
end
