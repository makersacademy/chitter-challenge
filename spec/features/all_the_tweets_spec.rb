require 'spec_helper'

feature 'User browses all the tweets' do
  before(:each) do
    Tweet.create(message: 'Hello World!',
                 user: 'Sammy')
  end

  scenario 'when opening the home page' do
    visit '/'
    expect(page).to have_content('Welcome to Chitter')
  end
end
