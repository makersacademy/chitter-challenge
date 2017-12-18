feature 'User login' do
  scenario 'should be able to visit the sign up page and login' do
    expect { log_in }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome 12345@live.xyz"
  end

  scenario 'should fail to add an account when the password and confirmed passord do not match' do
    expect { log_in_bad }.to change(User, :count).by(0)
    expect(page).to have_content "password mismatch, re-enter password"
    expect(page).to have_current_path('/users/new')
  end

  scenario 'a user should not be able to sign in with a blank email address' do
    expect { log_in_without_email }.to change(User, :count).by(0)
  end

  scenario 'a user should not be able to sign in with an invalid email address' do
    expect { log_in_with_bad_email }.to change(User, :count).by(0)
  end
end
