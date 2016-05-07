feature 'Signing in of registered user' do
  scenario 'Valid credentials - OK' do
    sign_in(user.email, user.password)
    expect(current_path).to eq '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'alias'
  end
  scenario 'Invalid credentials - TRY AGAIN' do
    sign_in(user.email, 'BAD_PASSWORD')
    expect(current_path).to eq '/users/login'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'The email or password is incorrect'
  end
end
