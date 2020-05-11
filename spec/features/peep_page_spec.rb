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

  scenario 'Has a Peep Post box / creates new peep' do 
    visit('/chitter')
    click_button('new_post')
    fill_in('peep', with: 'This is a new peep test')
    click_button('post')

    expect(page).to have_content('Welcome to Chitter')
    expect(page).to have_content('This is a new peep test made on ')
  end 

  scenario 'Has a timestamp' do 

    time = Time.new(2002,02,02)

    peep1 = Peep.create(text: 'This is a test timstamp peep', time: "#{time}" )

    visit ('/chitter')

    expect(page).to have_content("This is a test timstamp peep made on 2002-02-02 00:00:00")
  end
end 

=begin
connection = PG.connect(dbname: 'chitter_test')
    time = Time.new
    testing_time = connection.exec("INSERT INTO peep_record (text, time) VALUES ('This is a test timstamp peep', '#{time}');")
=end 