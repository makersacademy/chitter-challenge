require 'spec_helper'

feature 'signing up' do

  before(:each) do
    sign_up
  end

  scenario 'entering email and password' do
    expect(page.current_path).to eq '/'
  end

  scenario 'home page greets user' do
    expect(page).to have_text('Hi Bubbles!')
  end

  scenario "new user is created" do
    expect(User.first.username).to eq "Bubbles"
  end
end
