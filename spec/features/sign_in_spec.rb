# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

feature "Signing in" do
  background do
    let(:user) { User.make(email: 'user@example.com',
              password: 'caplin') }
  end

  scenario "Signing in with correct credentials" do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content('Welcome, #{user.email}')
  end

  let(:other_user) { User.create(email: 'other@example.com',
                                password: 'rous') }

  scenario "Signing in as another user" do
    sign_in(email: other_user.email,   password: other_user.password)
    expect(page).to have_content('Invalid email or password')
  end


end
