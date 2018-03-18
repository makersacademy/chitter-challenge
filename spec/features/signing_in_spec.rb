feature 'signing in' do
  scenario 'a previously registered user signs in' do
    visit '/'
    click_on 'Existing User Sign In'
    fill_in :email, with: 'prevreg@gmail.com'
    fill_in :password, with: 'password'
    click_on 'Sign In'
    expect(page).to have_content "Welcome, Previously Registered!"
    expect(page).not_to have_content "Welcome, anonymous!"
  end
  scenario 'attempting sign in with the wrong email' do
    visit '/'
    click_on 'Existing User Sign In'
    fill_in :email, with: 'not_registered@gmail.com'
    fill_in :password, with: 'password'
    click_on 'Sign In'
    expect(page).to have_content 'Email address not registered'
  end
  scenario 'attempting sign in with the wrong password' do
    visit '/'
    click_on 'Existing User Sign In'
    fill_in :email, with: 'prevreg@gmail.com'
    fill_in :password, with: 'not pasword'
    click_on 'Sign In'
    expect(page).to have_content 'Incorrect password'
  end
end
