feature 'User sign up' do
  scenario 'User can sign up for Chitter' do
    sign_up
    expect(User.first.name).to eq 'Matt'
    expect(User.first.username).to eq 'iammatthewward'
    expect(User.first.email).to eq 'matt@email.com'
    expect { sign_up }.to change(User, :count).by 1
  end

  scenario 'User password is saved securely' do
    sign_up
    expect(User.first.password_digest).not_to eq 'password'
  end

  scenario 'Username and email are unique' do
    sign_up

  end

  scenario 'Both password input must match' do
    expect { incorrect_sign_up }.not_to change(User, :count)
  end
end
