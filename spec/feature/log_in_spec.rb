feature 'log in' do

  let(:user) do
    User.create(username: 'HarryPotter',
                email: 'harrypotter@hogwarts.co.uk',
                password: 'patronus',
                password_confirmation: 'patronus')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end

end
