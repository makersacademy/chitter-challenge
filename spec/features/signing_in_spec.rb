feature 'user sign in' do
  scenario 'a user can sign in with email and password' do
    User.create(name: 'Bob', email: 'bob@gmail.com',
                password: 'password',
                password_confirmation: 'password')
    expect{ sign_in }.not_to change(User, :count)
    expect(page).to have_content "Welcome, Bob"
  end

  scenario 'a user cannot sign in with an incorrect password' do
    User.create(name: 'Bob', email: 'bob@gmail.com',
                password: 'password',
                password_confirmation: 'password')
    expect{ sign_in(password: "wrong") }.not_to change(User, :count)
    expect(page).not_to have_content "Welcome, Bob"
    expect(page).to have_content "Email or Password are incorrect"
  end
end
