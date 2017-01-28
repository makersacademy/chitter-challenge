
feature 'User sign in' do

  let!(:user) do
    User.create(email: 'test@test.com',
                password: 'test1234',
                password_confirmation: 'test1234')
  end

  scenario 'with correct sign in details' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end


end
