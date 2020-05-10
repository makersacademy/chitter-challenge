# GET /chitter >> shows peeps / button to write new peep 
require 'pg'

feature 'Main Chitter Page' do 
  scenario 'Main page shows multiple Peep posts' do 
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peep_record (text) VALUES ('This is a test peep');")
    connection.exec("INSERT INTO peep_record (text) VALUES('This is a second test');")
    connection.exec("INSERT INTO peep_record (text) VALUES('This is a third test');")
   
    visit('/chitter')

    expect(page).to have_content('This is a test peep')
    expect(page).to have_content('This is a second test')
    expect(page).to have_content('This is a third test')
  end 
end 


















=begin 
  scenario 'Has a Peep Post box' do 
    visit('/chitter')
    fill_in('peep', with: 'This is a test peep')
    click_button('post')

    expect(page).to have_content('Welcome to Chitter')
    expect(page).to have_content('This is a new peep test')
  end 
=end 