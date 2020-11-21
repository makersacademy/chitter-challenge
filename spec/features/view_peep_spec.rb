require 'pg'

feature 'Welcomes the user' do
  scenario 'A user can make a choice to view or post' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
    expect(page).to have_selector(:link_or_button, 'View Peeps')
    expect(page).to have_selector(:link_or_button, 'Post a Peep')
  end
end

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'First test peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Another test peep');")
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
    click_button('View Peeps')
    expect(current_path).to eq '/view'
    expect(page).to have_content "First test peep"
    expect(page).to have_content "Another test peep"
  end
end
