feature 'Sign in' do
  scenario 'Correct sign in' do
    sign_up('name', 'user', 'mail@test.test', '2', '2')
    sign_out
    sign_in('mail@test.test', '2')
    expect(page).to have_content('user')
  end

  scenario 'Incorrect sign in' do
    sign_up('name', 'user', 'mail@test.test', '2', '2')
    sign_out
    sign_in('mail@test.test', '1')
    expect(page).to have_content('Invalid email or password')
  end
end

feature 'Sign Out' do
  scenario 'Successful sign out' do
    sign_up('name', 'user', 'mail@test.test', '2', '2')
    sign_out
    sign_in('mail@test.test', '2')
    sign_out
    expect(page).to have_content('You have signed out')
  end
end
