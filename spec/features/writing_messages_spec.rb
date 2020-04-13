feature 'writing messages' do
  scenario 'A user can write messages and messages will be posted' do 
    visit ('/')
    connection = PG.connect(dbname: 'chitter_test')
    #connection.exec("INSERT INTO peeps (message, name) VALUES('hi', 'Gina');")
    #connection.exec("INSERT INTO peeps (message, name) VALUES('databases are fun', 'Guy');")
    fill_in('message', with: 'testing writing messages' )
    fill_in('name', with: 'Mr feature test' )
    click_button('peep')
    expect(page).to have_content 'testing writing messages'
    expect(page).to have_content 'Mr feature test'
  end
end   