feature 'User sign in' do

  let!(:user) do
    User.create(username: 'toby123',
                name: 'Toby m-l',
                email: 'toby@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "#{user.name}"
  end



end
