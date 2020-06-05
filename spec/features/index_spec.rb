require 'sinatra'

feature 'Chitter Homepage' do
  it 'Displays a homepage' do
    visit('/')
    expect(page).to have_content("Welcome to Chitter")
  end
end
