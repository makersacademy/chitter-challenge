feature 'Viewing peeps' do
  scenario 'user wants to see peeps' do
    DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('Test peep text');")
    DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('Another test peep text');")
    visit('/peeps')
    
    expect(page).to have_content('Test peep text')
    expect(page).to have_content('Another test peep text')
  end

  scenario 'peeps displayed in reverse chronological order' do
    DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('First test peep');")
    DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('Second test peep');")
    visit('/peeps')

    expect(first('.peep')).to have_content 'Second test peep'
  end
end
