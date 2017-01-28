feature 'user log in' do
  scenario 'user that has signed up can log in to app' do

    register

    visit '/'
    click_link('Log in')
    fill_in(:email, with: 'kmhicks92@gmail.com')
    fill_in(:password, with: '1234')
    click_button 'Sign in'

  end
end
