feature 'authentication' do
  it 'a user can sign in' do
    create_test_account
    sign_in
    expect(page).to have_content 'Welcome Tester'
  end

  it 'a user sees an error if they get their email wrong' do
    create_test_account
    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign In')
    expect(page).not_to have_content 'Welcome Tester'
    expect(page).to have_content 'Please check your email or password.'
  end
  it 'a user can sign out' do
    create_test_account
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign In')
    click_button('Sign Out')
    expect(page).not_to have_content 'Welcome Tester'
    expect(page).to have_content 'Thank you for using Chitter, come back soon!'
  end
  it 'a user sees an error if they get their password wrong' do
   create_test_account
   visit '/sessions/new'
   fill_in(:email, with: 'test@example.com')
   fill_in(:password, with: 'wrongpassword')
   click_button('Sign In')
   expect(page).not_to have_content 'Welcome Tester'
   expect(page).to have_content 'Please check your email or password.'
 end
end
