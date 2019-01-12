feature 'user visit index page' do
  scenario 'to see sign up, log in, post message function' do
    visit '/'
    expect(page).to have_link 'Sign Up', href: '/signup'
    expect(page).to have_link 'Log In', href: '/login'
    expect(page).to have_field 'msg'
    expect(page).to have_button 'send'
  end
end
