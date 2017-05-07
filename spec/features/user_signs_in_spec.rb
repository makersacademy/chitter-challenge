feature 'User signs in' do

  let!(:user) do
    User.create(name: 'Frodo Baggins',
                email: 'frodo@hobbiton.com',
                username: 'Ring Bearer',
                password: 'pr3c10u5',
                password_confirmation: 'pr3c10u5')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    #expect(current_path).to eq '/sessions/new'
    expect(page).to have_content "Welcome, #{user.name}"
  end
end
