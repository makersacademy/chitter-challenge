feature 'add a peep' do
  scenario 'user can add a peep' do
    drop_test_database
    populate_test_database
    visit '/'
    click_button 'compose_peep'
    fill_in :peep_text, with: 'This is chitter'
    click_button 'Submit'
    con = PG.connect dbname: 'chitter_test'
    result = con.exec "SELECT * FROM peeps where content = 'This is chitter'"
    expect(result.values[0][1]).to eq('This is a chitter')
  end
end
