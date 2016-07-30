

feature 'User sign up' do
  scenario 'I can sign up for an account' do
    expect{sign_up}.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, Shadow'
    expect(User.first.email).to eq 'not@email.com'
  end

  scenario 'with password confirmation' do
    expect{sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
end




def sign_up(password_confirmation: '12345')
  visit '/users/new'
  fill_in 'name', with: 'Shadow'
  fill_in 'user_handle', with: 'Shadow1'
  fill_in 'email', with: 'not@email.com'
  fill_in 'password', with: '12345'
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign up'
end

# feature 'User can sign in' do
# end
