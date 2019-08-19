require 'pg'
require 'spec_helper.rb'

feature 'viewing peeps:' do
  scenario 'you can view messages' do
    message = Message.create(text: 'my first comment', time: Time.now)
    visit('/messages')
    expect(page).to have_content('my first comment')
  end
end
