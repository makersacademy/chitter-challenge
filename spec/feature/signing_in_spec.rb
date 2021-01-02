feature 'signing in' do
  scenario 'user can sign in' do
    visit '/'
    sign_up
    fill_in 'email', with: 'panda@gmail.com'
    fill_in 'password', with: 'password123'
    click_on 'Log In'

    expect(page).to have_content 'Welcome back, Panda!'
  end
end