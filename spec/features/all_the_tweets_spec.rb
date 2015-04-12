require 'spec_helper'

feature 'User browses all the tweets' do
  before(:each) {
    Tweet.create(message: 'Hello World!',
                 user: 'Sammy')
  }

  scenario 'when opening the home page' do
    visit '/'
    expect(page).to have_content('Welcome to Chitter')
  end
end
