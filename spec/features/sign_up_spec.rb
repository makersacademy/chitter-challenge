feature 'has a functioning sign up page' do
  scenario 'has a sign up form with fields for email and password' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content "Welcome, yan@example.com"
    expect(User.first.email).to eq ('yan@example.com')
  end
end
