

feature 'User sign up' do
  scenario 'I can sign up for an account' do
    expect{sign_up}.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, Shadow'
    expect(User.first.email).to eq 'not@email.com'
  end
end

def sign_up
  visit '/users/new'
  fill_in 'name', with: 'Shadow'
  fill_in 'user_handle', with: 'Shadow1'
  fill_in 'email', with: 'not@email.com'
  fill_in 'password', with: '12345'
  click_button 'Sign up'
end
