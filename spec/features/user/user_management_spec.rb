feature 'When signing up' do
  
  let(:user) do
  User.create(email: 'user@example.com',
              username: 'Johndoe',
              password: 'secret1234',
              password_confirmation: 'secret1234')
  end

  scenario 'user can sign up' do
    user = build(:user)
    expect{sign_up(user)}.to change(User, :count).by (1)
    expect(page).to have_content("Welcome, #{user.username}")
    expect(User.first.email).to eq("#{user.email}")
  end

  scenario 'user can sign in' do
    sign_in(user)
    expect(page).to have_content "Welcome, #{user.username}"
  end

  scenario 'user can sign out' do
    sign_in(user)
    sign_out(user)
    expect(page).to have_content "Goodbye!"
  end
end