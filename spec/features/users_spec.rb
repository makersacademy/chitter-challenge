feature 'Sign up' do
  scenario 'user can sign up to Chitter' do
    expect {sign_up}.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, George'
    expect(User.first.email).to eq 'example@coldmail.com'
  end

  scenario 'sign up without matching passwords will fail' do
    expect {sign_up(password_confirmation: 'incorrect')}.to change(User, :count).by 0
    expect(page).to have_current_path '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'cannot sign up with a blank email' do
    expect {sign_up(email: nil)}.not_to change(User, :count)
  end

  scenario 'cannot sign up with a blank name' do
    expect {sign_up(name: nil)}.not_to change(User, :count)
  end

  scenario 'cannot sign up with a blank username' do
    expect {sign_up(username: nil)}.not_to change(User, :count)
  end

  scenario 'cannot sign up with an invalid email' do
    expect {sign_up(email: 'invalidemail')}.not_to change(User, :count)
  end
end
