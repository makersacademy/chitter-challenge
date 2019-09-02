require 'capybara'

feature 'allpeeps' do
  scenario 'view all peeps' do
    connection = PG.connect(dbname: 'chitter_manager_test')
    connection.exec("INSERT INTO chitter (message) VALUES ('My first chitter');")

    visit '/allpeeps'
    expect(page).to have_content 'All Peeps:'
    expect(page).to have_content "My first chitter"
  end
end
