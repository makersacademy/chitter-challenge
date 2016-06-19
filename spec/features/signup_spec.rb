feature 'User signup' do

  scenario 'user can signup' do
    signup
    expect(page).to have_content("Welcome, John Doe")
    expect(page).not_to have_selector(:link_or_button, 'Sign up')
  end

  scenario 'user count increases on succesful signup' do
    expect{signup}.to change{User.count}.by(1)
  end

  scenario 'username should be unique' do
    signup
    expect{signup(email: 'gto@gto.com',name: 'oioioi')}.not_to change{User.count}
  end

  scenario 'email should be unique' do
    signup
    expect{signup(username: 'different',name: 'different')}.not_to change{User.count}
  end

  scenario 'email should be email format' do
  	expect{signup(email: 'wrong')}.not_to change{User.count}
  end

  scenario 'requires a matching confirmation password' do
    expect { signup(password_confirmation: 'wrong') }.not_to change{User.count}
  end

  scenario 'password cannot be empty' do
  	expect { signup(password: '', password_confirmation: '') }.not_to change{User.count}
  end
end
