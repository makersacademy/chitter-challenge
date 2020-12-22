require 'pg'

feature 'Chitter homepage working' do
  scenario 'can view chitter homepage text' do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
  end
end 
