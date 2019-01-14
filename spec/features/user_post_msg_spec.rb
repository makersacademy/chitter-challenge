require 'pry'
feature 'post a message' do
  scenario 'to see the message with timestamp' do
    visit '/'
    fill_in :msg, with: '1st test message'
    click_on 'send'
    time = Time.now.strftime("%v %R")
    expect(page).to have_content '1st test message'
    expect(page).to have_content "#{time}"
  end
end
