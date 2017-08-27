require './app.rb'

feature 'There is a homepage' do
  scenario 'Homepage exists' do
    visit '/home'
    expect(page.status_code).to eq 200
  end
  scenario 'Homepage has welcome text' do
    visit '/home'
    expect(page).to have_content "Welcome to Chitter"
  end
end
