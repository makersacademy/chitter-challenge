require 'date'

feature 'timestamp' do
  let(:time) { DateTime.now.strftime "%H:%M" }
  scenario 'each comment has a time_stamp' do
    visit '/'
    fill_in 'message', with: 'An example of a message'
    click_button 'Peep'
    expect(page).to have_content "Sent at: #{time}"
  end
end
