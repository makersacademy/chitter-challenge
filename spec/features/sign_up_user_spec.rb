feature 'Signing up a new user' do
  
  scenario 'Signing up a user' do
    sign_up
    expect(page).to have_content('New User')
  end

  scenario 'fails when filling in a mismatching confirmation password' do
    visit('/sign_up')
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(page).to have_current_path('/sign_up')
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'fails when attempting to register the same email address twice' do
    sign_up(email: '123@fake.com')
    sign_up(email: '123@fake.com')
    expect(page).to have_current_path('/sign_up')
    expect(page).to have_content "Email is already taken"
  end

  scenario 'fails when attempting to register the same username twice' do
    sign_up(username: 'fakeuser')
    sign_up(username: 'fakeuser')
    expect(page).to have_current_path('/sign_up')
    expect(page).to have_content "Username is already taken"
  end

end
