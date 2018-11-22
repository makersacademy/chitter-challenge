require_relative '../spec_helper'

RSpec.configure do |config|
  config.before(:each) do
    reset_test_database
  end
end

feature 'Posting Peeps' do
  scenario 'can see peep I\'ve just posted' do
    peep = Peep.create(username:"danusia.x", content:"Hello Chitter!")
    visit '/'
    expect(page).to have_content "danusia.x"
    expect(page).to have_content "Hello Chitter!"
  end
end
