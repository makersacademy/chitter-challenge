feature 'Viewing peeps' do
  scenario "'/' route redirects to '/peeps'" do
    visit '/'
    expect(current_path).to eq('/peeps')
  end

  scenario 'A user can view peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (text) VALUES ('test peep 1'), ('test peep 2'), ('test peep 3');")

    visit '/peeps'

    expect(page).to have_content('test peep 1')
    expect(page).to have_content('test peep 2')
    expect(page).to have_content('test peep 3')
  end
end