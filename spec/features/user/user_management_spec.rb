feature 'When signing up' do
  
  let(:user) do
  User.create(email: 'user@example.com',
              username: 'Johndoe',
              password: 'secret1234',
              password_confirmation: 'secret1234')
  end

  let(:no_email) do
  User.create(email: nil,
              username: 'bla',
              password: 'secret1234',
              password_confirmation: 'secret1234')
  end

  let(:no_username) do
  User.create(email: nil,
              username: nil,
              email: "",
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

  scenario 'cannot sign up without an email' do
    sign_up(no_email)
    click_button 'Sign up'
    expect(page).to have_content "Email must not be blank"
  end

  scenario 'cannot sign up without an username' do
    sign_up(no_username)
    click_button 'Sign up'
    expect(page).to have_content "Username must not be blank"
  end

end