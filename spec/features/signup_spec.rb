require 'faker'

feature 'signing up for Chitter' do
  scenario 'signup page has a form for signing up' do
    visit '/'

    expect(page).to have_field 'name'
    expect(page).to have_field 'username'
    expect(page).to have_field 'email'
    expect(page).to have_field 'password'

    expect(page).to have_button 'Sign up!'
  end

  scenario 'submitting your user details redirects you to the home page' do
    visit '/'
    fill_in 'name', with: Faker::Name.name
    fill_in 'username', with: Faker::Internet.username
    fill_in 'email', with: Faker::Internet.email
    fill_in 'password', with: Faker::Internet.password
    click_button 'Sign up!'

    expect(page).to have_current_path('/home')
  end
end
