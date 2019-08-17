require 'spec_helper.rb'

feature 'viewing peeps:' do
  scenario 'you can view messages' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (text) VALUES ('my first comment');")
    connection.exec("INSERT INTO peeps (text) VALUES ('my second comment');")
    visit('/')
    expect(page).to have_content('my first comment')
    expect(page).to have_content('my second comment')
  end
end