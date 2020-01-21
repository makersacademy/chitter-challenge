feature 'Viewing peeps' do
  scenario 'A user can see their peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    #add the test data
    Chitter.create(message: "Hello World!")
    Chitter.create(message: "This is another peep")
    Chitter.create(message: "This is a third peep!")

    visit '/'

    expect(page).to have_content "Hello World!"
    expect(page).to have_content "10:20:25.998928+00"
  end
end
