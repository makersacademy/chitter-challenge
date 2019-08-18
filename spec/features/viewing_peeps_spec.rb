feature 'Viewing Peeps' do
  scenario 'all peeps are shown in reverse chronological order' do
    DatabaseConnection.query("INSERT into peeps (message) VALUES('peep1');")
    DatabaseConnection.query("INSERT into peeps (message) VALUES('peep2');")
    visit '/peeps'
    expect(page.all('li')[0].text).to eq "peep2"
    expect(page.all('li')[1].text).to eq "peep1"
  end
end