feature 'Sign in' do
  scenario 'Correct sign in' do
    sign_up('name', 'username', 'mail@test.test', '2', '2')
    sign_in('mail@test.test', '2')
    expect(page).to have_content('username')
  end

  scenario 'Incorrect sign in' do
    sign_up('name', 'username', 'mail@test.test', '2', '2')
    sign_in('mail@test.test', '1')
    expect(page).to have_content('Invalid email or password')
  end
end
