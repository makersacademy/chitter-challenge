feature 'Time message was posted' do
  scenario 'creates a timestamp when message posted' do
    time = Time.new(2022, 05, 15, 10, 30, 15)
    time_test = time.strftime('%Y-%m-%d %H:%M:%S')
    allow(Time).to receive(:now).and_return(time_test)

    visit('/messages/new')
    fill_in :peep, with: 'New Chitter, what time is it?!'
    click_button('Submit')

    expect(page).to have_content '2022-05-15 10:30:15'

  end
end