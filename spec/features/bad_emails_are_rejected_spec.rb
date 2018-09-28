require 'users'

feature 'the user can sign up to chitter' do
  scenario 'from the home page' do
    visit_sign_up_page
    fill_in 'name', with: 'Borace'
    fill_in 'username', with: 'Borace01'
    fill_in 'email', with: 'Borace01'
    fill_in 'password', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'Invalid sign up details, please try again'
    users = Users.new
    borace_hash = { name: 'Borace', email: 'borace@gmail.com',
                    username: 'borace01', password: 'password' }
    expect(users.all).not_to include(borace_hash)
  end
end
