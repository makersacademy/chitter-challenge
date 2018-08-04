require 'pg'

feature 'submit a peep' do
  scenario 'peep shows on feed page' do
    visit ('/login')
    fill_in('username', with: 'eddyt993')
    click_button 'Submit'
    fill_in('peep', with: 'Where we dropping boys?')
    click_button 'Submit'
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("SELECT * FROM peeps;")

    expect(page).to have_content "Where we dropping boys?"
  end
end
