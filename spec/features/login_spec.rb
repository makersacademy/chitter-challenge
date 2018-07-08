require './app.rb'

feature 'log in' do
  scenario 'user can log in to chitter' do
    visit '/'
    click_button('Sign in')
    fill_in('username', with: 'test')
    fill_in('password', with: 'test123')
    click_button('Log in')

    expect(page).to have_content 'Welcome test'
  end
end
