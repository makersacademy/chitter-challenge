feature 'FEATURE: signing out' do

  let!(:user) do
    User.create(email: 'alice@example.com', name: 'Alice',
                username: 'Ali', password: '1234',
                password_confirmation: '1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,  password: user.password)
    sign_out
    expect(page).not_to have_content "Welcome, #{user.username}"
    expect(page).to have_content 'Bye!'
  end
end
