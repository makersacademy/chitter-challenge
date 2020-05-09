feature 'Viewing peeps' do
  scenario 'user can view list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (content) VALUES ('Summer is here yay');")
    visit '/peeps'
    expect(page).to have_content('Summer is here yay')
  end
end
