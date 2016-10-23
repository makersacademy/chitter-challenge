feature 'User log in ' do
  let!(:user) do User.create(email: 'andy@makers.com',
              password: 'password',
              password_confirmation: 'password',
              name: 'Andy',
              username: 'andy')
            end
  scenario 'with correct credentials' do
    log_in(email: user.email, password: user.password)
    expect(page).to have_content " #{user.name}"

  end
end
