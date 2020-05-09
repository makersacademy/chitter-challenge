feature 'Viewing peeps' do
  scenario 'views peeps in reverse cronological order' do
    Peep.create(username: "Gareth", message: "First message")
    sleep 1
    Peep.create(username: "Gareth", message: "Second message")
    sleep 1
    Peep.create(username: "Gareth", message: "Third message")

    visit('/')

    expect(page.first('.peep p').text).to have_content "Third message"
  end
end
