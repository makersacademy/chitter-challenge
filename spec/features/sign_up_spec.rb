# As a user
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'User Sign-Up' do
  scenario 'user names, emails and passwords are stored on valid signup' do
    expect{sign_up(email: 'joe.bloggs@gmail.com')}.to change(User, :count).by 1
    expect(User.first.email).to eq 'joe.bloggs@gmail.com'
  end
  
  scenario 'flash error if user password and confirmation do not match' do
    expect{sign_up(password_confirmation: 'wrong')}.to_not change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end
  
  scenario 'flash error if user signs up with a blank username' do
    expect{sign_up(username: '')}.to_not change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Username must not be blank'
  end
  
  scenario 'flash error if username already exists in database' do
    sign_up(username: 'joeb')
    expect{sign_up(username: 'joeb')}.to_not change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Username is already taken'       
  end

  scenario 'flash error if user signs up with a blank email' do
    expect{sign_up(email: '')}.to_not change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'flash error if user signs up with invalid email' do
    expect{sign_up(email: 'invalid@email')}.to_not change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'flash error if sign up email already exists in database' do
    sign_up(email: 'joe.bloggs@gmail.com')
    expect{sign_up(email: 'joe.bloggs@gmail.com')}.to_not change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email is already taken'       
  end

  xscenario 'perisit user info when there is an error' do
    sign_up(password_confirmation: 'wrong_password')
    expect(page).to have_content 'Joe Bloggs'
    expect(page).to have_content 'joeb'
    expect(page).to have_content 'joe.bloggs@gmail.com'
  end 
end


