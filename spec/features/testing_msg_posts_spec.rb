# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

require 'pg'

feature 'Posting messages' do

  # scenario 'posted first message appears' do
  #   visit('/enter_msg')
  #   fill_in :message, with: 'hello everyone!'
  #   click_button 'Submit'
  #   expect(page).to have_content 'hello everyone!'
  # end

  scenario 'display chitter chits' do

    conn = PG.connect(dbname: 'chitter_test')

    conn.exec("INSERT INTO chits (message) VALUES('hello everyone')")
    conn.exec("INSERT INTO chits (message) VALUES('this is a first chit')")
    conn.exec("INSERT INTO chits (message) VALUES('this is a second!!!')")

    visit('/list_msgs')

    expect(page).to have_content("hello everyone")
    expect(page).to have_content("this is a first chit")
    expect(page).to have_content("this is a second!!!")
  end
end
