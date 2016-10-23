require 'spec_helper'

feature 'logging in' do

  before(:each) do
    sign_up
  end

  scenario 'login takes you back to homepage and greets you' do
    login
    expect(page).to have_content("Hi Bubbles")
  end

  scenario 'no new database entry is created' do
    login
    expect(User.count(username: 'Bubbles')).to eq 1
  end
end
