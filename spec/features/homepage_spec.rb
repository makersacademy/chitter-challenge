feature 'Home page' do
  scenario 'has a feild to write a peep' do
    visit_and_add_peep('my first peep')

    expect(current_path).to eq('/chitter')
  end

  scenario 'shows all the peeps newest first with time stamps' do
    visit_and_add_peep('my first peep')
    expect(page).to have_content('my first peep')
    visit_and_add_peep('my second peep')
    time = DatabaseConnection.query("SELECT time_stamp FROM peeps WHERE text='my second peep'")[0]['time_stamp']

    expect(page).to have_content("my second peep at #{time}")
  end

  scenario 'shows time of peep' do
    
  end
end
