require 'launchy'
require 'web_helper'

feature "Accounts" do

  before do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  after do
    DatabaseCleaner.clean
  end
  scenario "User signs up" do
    sign_up
    expect(page).to have_content("Welcome to Chitter, jennyb!")
    expect(User.first.email).to eq('jenniferbacon@hotmail.com')
    expect { sign_up }.to change(User, :count).by(1)
  end
end
