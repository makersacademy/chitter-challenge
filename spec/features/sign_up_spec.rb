feature 'Sign up to Chitter' do
  scenario 'User submits form to sign up to Chitter' do
    expect { sign_up }.to change(User, :count).by(1)
  end
end
