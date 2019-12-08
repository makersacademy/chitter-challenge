require_relative './../../app/chitter_app.rb'

feature 'Homepage' do
  scenario 'when a user visits the site for the first time' do
    visit('/chitter/home')
    expect(page).to have_content "Welcome to Chitter!"
  end
end

feature 'Option to sign in' do
  scenario 'when a user already has an account, and wants to sign in' do
    visit('/chitter/home')
    expect(page).to have_content "If you're already a user, please sign in below"
    expect(page).to have_content "Username:"
    expect(page).to have_content "Password:"
  end
end

feature 'Option to sign up' do 
  scenario 'when a new user would like to create an account' do 
    visit('/chitter/home')
    expect(page).to have_content "Please sign up below:"
    expect(page).to have_content "Desired Username:"
    expect(page).to have_content "Desired Password:"
  end
end