feature 'Viewing peeps' do
  # scenario 'visits index page' do
  #   visit('/')
  #   expect(page).to have_content 'First peep!'
  # end
  scenario 'views peeps in reverse cronological order' do
    Peep.create(username: "Gareth", message: "First message")
    sleep 1
    Peep.create(username: "Gareth", message: "Second message")
    sleep 1
    Peep.create(username: "Gareth", message: "Third message")

    visit('/')

    expect(page.first('.peep p').text).to eq "Third message"
  end
end
