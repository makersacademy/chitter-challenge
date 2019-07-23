feature 'message' do
  scenario 'allow to post a peep' do
    visit('/peep')
    # click_button('Submit')
    fill_in 'peep', :with => 'Hi, how are you?'
    click_button('Send')

    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO messages(peep) VALUES ('Hi, how are you?');")
    expect(page).to have_content 'Hi, how are you?'
  end
end
