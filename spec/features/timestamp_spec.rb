require 'date'

feature 'timestamp' do
  let(:time) { Time.now.strftime "%H:%M" }
  scenario 'each comment has a time_stamp' do
    sign_up
    fill_in 'message', with: 'An example of a message'
    click_button 'Peep'
    expect(page).to have_content "Sent at: #{time}"
  end
end
