feature 'User sign up' do
  scenario 'a new user can sign up and is added in the database' do
    factory_user = build :user
    expect { sign_up(factory_user) }.to change(User, :count).by(1)
    expect(User.first.email).to eq('john@doe.com')
    expect(User.first.name).to eq('John Doe')
    expect(User.first.username).to eq('JD03')
  end
end
