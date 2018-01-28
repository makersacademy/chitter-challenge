# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

feature 'User sign in' do
  scenario 'with correct username and password' do
    create_test_user
    sign_in
    expect(page).to have_content "Logged in as mr_ed"
  end
  scenario 'with wrong username and password' do
    create_test_user
    sign_in(password: 'wrong')
    expect(page).not_to have_content "Logged in as mr_ed"
    expect(page).to have_content "The email or password is incorrect"
  end
end

