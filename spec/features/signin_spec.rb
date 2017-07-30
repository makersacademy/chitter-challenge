feature 'Feature: Signing in' do

  let!(:user) do
    User.create(email: 'alice@example.com', name: 'Alice',
                username: 'Ali', password: '1234',
                password_confirmation: '1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,  password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end
end
