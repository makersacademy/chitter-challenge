require './app/app.rb'

feature 'Startup' do
  scenario 'I can sign up for Chitter' do
    visit '/registration'
    fill_in 'name', with: 'Andy'
    fill_in 'e-mail', with: 'andy@makers.com'
    fill_in 'password', with: 'makerspassword'
    click_button 'register'
  end
end
