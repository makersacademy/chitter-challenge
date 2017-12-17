feature 'has a functioning sign up page' do
  scenario 'has a sign up form with fields for email and password' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content "Welcome, yan@example.com"
    expect(User.first.email).to eq ('yan@example.com')
  end

  scenario 'does not create new user if password is mismatched' do
    expect { sign_up_badly }.to change(User, :count).by(0)
    expect(page).to have_content "Password does not match the confirmation"
  end

end
