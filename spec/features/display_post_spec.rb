feature "list peeps" do
  scenario "provide a list of your peeps" do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO entry VALUES(1, 'first');")

    visit('/display')
    expect(page).to have_content 'first' 
  end
end