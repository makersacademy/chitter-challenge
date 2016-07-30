
feature 'User sign up' do

  def sign_up(name: "John Smith",
              email: "john.smith@example.com",
              username: "jsmith",
              password: '12345',
              password_confirmation: '12345')
    visit '/users/new'
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to(have_content("Hello, jsmith"))
    expect(User.first.email).to(eq("john.smith@example.com"))
  end

  scenario 'requires a matching password confirmation' do
    expect { sign_up(password_confirmation: "wrong") }.not_to(change(User, :count))
  end

  scenario 'with an incorrect password confirmation' do
    sign_up(password_confirmation: "Wrong")
    expect(current_path).to(eq('/users'))
    expect(page).to(have_content("Password does not match the confirmation"))
  end

  scenario 'sign up without name' do
    expect { sign_up(name: nil) }.not_to(change(User, :count))
  end

  scenario 'sign up without email' do

  end

  scenario 'sign up without username' do

  end

  scenario 'sign up without password' do

  end

end
