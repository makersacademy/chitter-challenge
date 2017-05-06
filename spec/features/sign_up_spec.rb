feature 'Sign up' do
  scenario 'I can sign up to Chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('jessica@email.com')
  end

  scenario 'I must sign up with a unique email and username' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
  end

end
