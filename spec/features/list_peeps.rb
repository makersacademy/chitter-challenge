eature 'List all peeps' do
  scenario 'List peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'WOW!', 'jess', '12:00 PM';")

    visit('/peeps')

    expect(page).to have_content "WOW!"
    expect(page).to have_content "jess"
    expect(page).to have_content "12:00 PM"
    expect(page.status_code).to eq 200

  end
end
