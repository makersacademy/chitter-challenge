feature 'Sign up' do
  scenario 'I can sign up for an account' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, Cloud Strife'
  end
end
