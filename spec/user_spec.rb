feature 'call on messages to access ID' do
  scenario 'correctly' do

    test_connection = PG.connect(dbname: 'chitter')
    person1 = Person.new
    person2 = Person.new

    test_connection = PG.connect(dbname: 'chitter')

    # test_connection.exec("INSERT INTO messages (name) VALUES (person1),(person2);")
    #

    expect(person1).to have_content %q{person 1 message}
    expect(page).not_to have_content 'person 1 message'

  end
end
