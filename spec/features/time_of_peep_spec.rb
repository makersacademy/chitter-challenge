feature 'Time of creation of post is visible' do
  scenario 'timestamp created at time of submission' do
    t = Time.new(2022, 04, 31, 5, 0, 10)
    time_test = t.strftime('%Y-%m-%d %H:%M:%S')
    allow(Time).to receive(:now).and_return(time_test)
    visit('/')
    fill_in 'message', with: 'Test timestamp'
    click_button 'Submit'
    time = find('#posts .column_two').text
    expect(time).to eq "2022-05-01 05:00:10"
  end
end
