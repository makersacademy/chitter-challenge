def sign_up
  visit '/users/new'
  fill_in :name, with: 'John Smith'
  fill_in :username, with: 'johnsmith'
  fill_in :email, with: 'johnsmith@gmail.com'
  fill_in :password, with: 'banana!'
  fill_in :password_confirmation, with: 'banana!'
  click_button 'Sign up'
end

def bad_password
  visit '/users/new'
  fill_in :name, with: 'John Smith'
  fill_in :username, with: 'johnsmith'
  fill_in :email, with: 'johnsmith@gmail.com'
  fill_in :password, with: 'banana!'
  fill_in :password_confirmation, with: 'banadsfadfaasdfadfna!'
  click_button 'Sign up'
end 

def blank_email
  visit '/users/new'
  fill_in :name, with: 'John Smith'
  fill_in :username, with: 'johnsmith'
  fill_in :email, with: ''
  fill_in :password, with: 'banana!'
  fill_in :password_confirmation, with: 'banana!'
  click_button 'Sign up'
end

def invalid_email
  visit '/users/new'
  fill_in :name, with: 'John Smith'
  fill_in :username, with: 'johnsmith'
  fill_in :email, with: 'johnsmith@gmail'
  fill_in :password, with: 'banana!'
  fill_in :password_confirmation, with: 'banana!'
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
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'User enters a blank email' do 
    expect{blank_email}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'User enters an invalid email' do 
    expect{invalid_email}.not_to change(User, :count)
  end

  scenario 'User enters a duplicate email' do 
    sign_up
    expect{sign_up}.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
