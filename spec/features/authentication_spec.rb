feature 'authentication' do
  scenario 'a user can successfully sign in' do
    create_user_and_visit_sign_in
    user_sign_in
    expect(page).to have_content 'Welcome, cat@email.com'
  end

  scenario 'a user sees an error if their email is incorrect' do
    create_user_and_visit_sign_in
    fill_in(:email, with: 'cate@email.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    expect(page).not_to have_content 'Welcome, cat@email.com'
    expect(page).to have_content 'Please check your email or password!'
  end

  scenario 'a user sees an error if their password is incorrect' do
    create_user_and_visit_sign_in
    fill_in(:email, with: 'cat@email.com')
    fill_in(:password, with: 'password')
    click_button('Sign in')
    expect(page).not_to have_content 'Welcome, cat@email.com'
    expect(page).to have_content 'Please check your email or password!'
  end

  scenario 'a user can sign out' do
    create_user_and_visit_sign_in
    user_sign_in
    click_button('Sign out')
    expect(page).not_to have_content 'Welcome, cat@email.com'
    expect(page).to have_content 'You have signed out!'
  end
end
