

feature 'User sign up' do
  scenario 'I can sign up for an account' do
    expect{sign_up}.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, Shadow'
    expect(User.first.email).to eq 'not@email.com'
  end

  scenario 'with password confirmation' do
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

end


def sign_up(email: 'not@email.com', password_confirmation: '12345')
  visit '/users/new'
  fill_in 'name', with: 'Shadow'
  fill_in 'user_handle', with: 'Shadow1'
  fill_in 'email', with: email
  fill_in 'password', with: '12345'
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign up'
end

# feature 'User can sign in' do
# end
