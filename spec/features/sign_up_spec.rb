feature 'sign up' do
  scenario 'A new user can sign up' do
    expect {sign_up}.to change(User, :count).by 1
    expect(page).to have_content('Welcome example93')
    expect(User.first.email).to eq('example@gmail.com')
  end

  scenario 'requires a matching confirmation password' do
    sign_up password_confirmation: '54321'
    expect { sign_up(password_confirmation: 'wrong_password') }.not_to change User, :count
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'user can\'t sign up without email' do
    expect{sign_up email: nil}.not_to change User, :count
    expect(current_path).to eq '/users'
    expect(page).to have_content "Email must not be blank"
  end

  scenario 'can\'t sign in with invalid email' do
    expect{sign_up email: 'example.com'}.not_to change User, :count
    expect(current_path).to eq '/users'
    expect(page).to have_content "Email has an invalid format"
  end

  scenario 'can\'t sign up with an already registered email' do
    sign_up
    expect{sign_up}.not_to change User, :count
    expect(page).to have_content "Email is already taken"
  end

  scenario 'user can\'t sign up without username' do
    expect{sign_up username: nil}.not_to change User, :count
    expect(current_path).to eq '/users'
    expect(page).to have_content "Username must not be blank"
  end

  scenario 'user can\'t sign up without name' do
    expect{sign_up name: nil}.not_to change User, :count
    expect(current_path).to eq '/users'
    expect(page).to have_content "Name must not be blank"
  end
end
