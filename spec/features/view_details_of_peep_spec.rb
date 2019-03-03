feature 'View details of peep' do
  scenario 'view details of a peep' do
    conn = PG.connect(dbname: 'chitter_test')
    result = conn.exec("INSERT INTO peep (message, posted_by) values('This is a peep created by the test database helper', 1) returning id, message, time_posted, posted_by;").first
    p peep_time_posted = result['time_posted']
    peep_id = result['id'].to_i
    peep_message = result['message']
    #conn.exec("INSERT INTO peep (message, posted_by) values('This is a second peep created by the test database helper', 1);")
    visit '/chitter/peep/all'
    click_button "Detail"
    expect(page).to have_content "#{peep_message}"
    expect(page).to have_content "created at: #{peep_time_posted}"
  end
end
