feature 'User signup' do
  scenario 'can create an account' do
    expect { user_signup }.to change{ User.count }.by(1)
    expect(page).to have_content 'Welcome, JohnnyD!'
  end
end
