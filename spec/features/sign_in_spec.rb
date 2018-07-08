require './app.rb'

feature 'sign up' do
  scenario 'user can sign up for chitter' do
    visit '/'
    click_button("Register")
    fill_in('email', with: 'test@gmail.com')
    fill_in('username', with: 'test')
    fill_in('name', with: 'testname')
    fill_in('password', with: 'test123')
    click_button('Sign up')

    expect(page).to have content 'Welcome test'
  end
end
