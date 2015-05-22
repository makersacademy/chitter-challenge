require 'peep'
require 'user'

feature 'User can browse list of messages' do
  before (:each) do
    Peep.create(username: 'Jo',
                message: 'Hello',
                created_at: Time.now)
  end
  scenario 'see latest messages opening the home page' do
    visit '/'
    expect(page).to have_content('Hello')
  end
end