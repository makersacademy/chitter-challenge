# frozen_string_literal: true

require './app'

feature 'viewing quacks' do
  scenario 'shows a list of quack messages' do
    connection = PG.connect(dbname: 'duckboard_test')

    connection.exec("INSERT INTO quacks (message, display_name) VALUES ('Love is strength', 'Quackie');")
    connection.exec("INSERT INTO quacks (message, display_name) VALUES ('Dream it, be it', 'T0ilet_duck');")
    connection.exec("INSERT INTO quacks (message, display_name) VALUES ('The last word', 'Duck_Tape');")
    
    visit('/')
    expect(page).to have_content('Love is strength')
    expect(page).to have_content('Dream it, be it')
    expect(page).to have_content('The last word')
  end

  scenario 'shows who quacked' do
    connection = PG.connect(dbname: 'duckboard_test')

    connection.exec("INSERT INTO quacks (message, display_name) VALUES ('Love is strength', 'Quackie');")
    connection.exec("INSERT INTO quacks (message, display_name) VALUES ('Dream it, be it', 'T0ilet_duck');")
    connection.exec("INSERT INTO quacks (message, display_name) VALUES ('The last word', 'Duck_Tape');")
    
    visit('/')
    expect(page).to have_content('quacked by Quackie')
    expect(page).to have_content('quacked by T0ilet_duck')
    expect(page).to have_content('quacked by Duck_Tape')
  end

  scenario 'shows timestamp of quack' do
    connection = PG.connect(dbname: 'duckboard_test')

    connection.exec("INSERT INTO quacks (message, display_name) VALUES ('Love is strength', 'Quackie');")
    connection.exec("INSERT INTO quacks (message, display_name) VALUES ('Dream it, be it', 'T0ilet_duck');")
    connection.exec("INSERT INTO quacks (message, display_name) VALUES ('The last word', 'Duck_Tape');")
    
    visit('/')
    loadhour = Time.now.strftime("%F %H:")
    expect(page).to have_content("at #{ loadhour }")
  end

  scenario 'displays in reverse chronological order' do
    connection = PG.connect(dbname: 'duckboard_test')

    connection.exec("INSERT INTO quacks (message, display_name) VALUES ('Love is strength', 'Quackie');")
    connection.exec("INSERT INTO quacks (message, display_name) VALUES ('Dream it, be it', 'T0ilet_duck');")
    connection.exec("INSERT INTO quacks (message, display_name) VALUES ('The last word', 'Duck_Tape');")
    
    visit('/')
    expect(page).to have_content("Latest quacks:\n\"The last word\" quacked by Duck_Tape, at")
  end
end
