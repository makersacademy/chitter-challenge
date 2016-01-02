feature 'User sign up' do
  scenario 'I can sign up as a new user with valid password' do
    expect { sign_up }.to change { User.count }.by(1)
    expect(User.first.email).to eq('test@email.com')
  end
end
