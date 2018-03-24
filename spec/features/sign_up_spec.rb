feature 'signing up' do
  scenario 'user can sign up' do
    sign_up

    expect(page).to have_content 'Welcome to Chitter, MarcoAsensio!'
  end

  # TODO: this must be avoided, as if the test above fails, this one will fail automatically, even if the
  # feature implementation is correct. 2 solutions here:
    # 1. Truncate test DB table after each test
    # 2. Just sign-up with a new account twice
  scenario 'same email cannot be used twice' do
    sign_up

    expect(page).to have_content 'Email is already taken'
  end
end
