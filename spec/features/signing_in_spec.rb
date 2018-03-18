feature 'signing in' do
  scenario 'a previously registered user signs in' do
    visit '/'
    click_on 'Sign In'
    fill_in :email, with: 'prevreg@gmail.com'
    fill_in :password, with: 'password'
    expect(page).to have_content "Welcome, Previously Registered!"
    expect(page).not_to have_content "Welcome, anonymous!"
  end
end
