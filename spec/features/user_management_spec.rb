feature 'User sign up' do
  scenario 'can sign up for an account' do
    expect{sign_up}.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, Shadow'
    expect(User.first.email).to eq 'not@email.com'
  end

  scenario 'cannot sign up unless passwords match' do
    expect{sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'cannot sign up without an email address' do
    expect{sign_up(email: nil)}.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'cannot sign up with invalid email address' do
    expect{sign_up(email: 'invalid@email')}.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'cannot sign up with an existing email address' do
    sign_up
    expect {sign_up}.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'cannot sign up with an existing username' do
    sign_up
    expect {sign_up(email: 'valid@email.com')}.not_to change(User, :count)
    expect(page).to have_content 'Handle is already taken'
  end
end

feature 'User can sign in' do
  let!(:user) do
    User.create(name: 'new user',
                handle: 'new_user1',
                email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, new user"
  end
end

feature 'User can sign out' do
  let!(:user) do
    User.create(name: 'new user',
                handle: 'new_user1',
                email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end
  scenario 'when signed in' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign out'
    expect(page).to have_content 'Goodbye'
    expect(page).not_to have_content 'Welcome'
  end
end
