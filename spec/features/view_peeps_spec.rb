feature 'viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'Hi rio do u want picking up in the morning pal');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Mr bean. Funny');")
    visit('/peeps')

    expect(page).to have_content('Hi rio do u want picking up in the morning pal')
    expect(page).to have_content('Mr bean. Funny')
  end
end
