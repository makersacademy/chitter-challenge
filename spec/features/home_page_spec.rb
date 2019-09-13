require './app.rb'

feature 'checks if homepage working' do
  scenario 'home button has hello in it' do
    visit('/')
    expect(page).to have_content('hello')
  end
end
