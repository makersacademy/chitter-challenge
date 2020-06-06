require 'sinatra'

feature 'Chitter Homepage' do
  scenario 'Displays a homepage' do
    visit('/')
    expect(page).to have_content("Welcome to Chitter")
  end
end
