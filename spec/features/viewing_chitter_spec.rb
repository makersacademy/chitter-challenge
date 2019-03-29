feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
    expect(current_path).to eq "/chitter"
  end

  scenario 'a user can see peeps' do
    connection = PG.connect(dbname: 'chitter_app_test')
    connection.exec("INSERT INTO chitter (name, handle, time, content) VALUES ('masha', 'user_masha', CURRENT_TIMESTAMP, 'peep1');")
    connection.exec("INSERT INTO chitter (name, handle, time, content) VALUES ('masha', 'user_masha', CURRENT_TIMESTAMP, 'peep2');")
    connection.exec("INSERT INTO chitter (name, handle, time, content) VALUES ('masha', 'user_masha', CURRENT_TIMESTAMP, 'peep3');")

    visit('/')

    expect(page).to have_content "peep1"
    expect(page).to have_content "peep2"
    expect(page).to have_content "peep3"
  end
end
