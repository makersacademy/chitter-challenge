
feature 'I can sign up to chitter' do
  scenario 'My details are stored and I am welcomed' do
    expect{signup}.to change{User.count}.by(1)
    expect(current_path).to eq '/session'
    expect(page).to have_content('Hello, User1')
  end

  scenario 'I cannot sign up without a username' do
    signup(username:'')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content('Username must not')
  end


  scenario 'I cannot sign up without an email' do
    signup(email:'')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content('Email must not')
  end

  scenario 'My password and confirmation must be the same' do
    signup(password_confirmation: 'wrong password')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content('Password does not match')
  end

  scenario 'I cannot sign up with an existing username' do
    signup
    signup(username:'user1',email: 'new_email')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content('Username is already')
  end

  scenario 'I cannot sign up with an existing email' do
    signup
    signup(username:'new_user',email: 'user1@email.com')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content('Email is already')
  end


end
