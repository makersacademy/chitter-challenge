def sign_up
  visit '/users/new'
  fill_in :email, with: 'johnsmith@gmail.com'
  fill_in :password, with: 'banana!'
  fill_in :password_confirmation, with: 'banana!'
  click_button 'Sign up'
end

def bad_password
  visit '/users/new'
  fill_in :email, with: 'johnsmith@gmail.com'
  fill_in :password, with: 'banana!'
  fill_in :password_confirmation, with: 'banadsfadfaasdfadfna!'
  click_button 'Sign up'
end 

feature 'User sign up' do 
  scenario 'User can sign up' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, johnsmith@gmail.com')
    expect(User.first.email).to eq('johnsmith@gmail.com')
  end

  scenario 'User enters passwords that do not match' do 
    expect{bad_password}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
