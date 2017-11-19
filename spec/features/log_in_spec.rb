
feature 'Sign in' do
  scenario 'Correct sign in' do
    sign_up('name', 'user', 'email@email.com', 'pass', 'pass')
    sign_out
    sign_in('email@email.com', 'pass')
    expect(page).to have_content('user')
  end

  scenario 'Incorrect sign in' do
    sign_up('name', 'user', 'email@email.com', 'pass', 'pass')
    sign_out
    sign_in('email@email.com', 'not_pass')
    expect(page).to have_content('Invalid email or password')
  end
end
