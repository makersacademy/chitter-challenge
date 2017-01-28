feature 'user log in' do
  scenario 'user that has signed up can log in to app' do

    register

    visit '/'
    click_link('Log in')
    fill_in(:email, with: 'phil_j_williams@hotmail.com')
    fill_in(:password, with: 'TopQuark')
    click_button 'Sign in'

  end
end
