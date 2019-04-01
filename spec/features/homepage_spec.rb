require_relative '../../app.rb'

feature 'Homepage' do
  scenario 'welcomes user to the chitter app' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end