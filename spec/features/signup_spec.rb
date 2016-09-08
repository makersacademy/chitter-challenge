feature 'user successfully signs up' do

  scenario 'user signs up with email and password' do
    sign_up
    expect(page).to have_content ("Hello @SuperRafi")
  end

  scenario 'user can sign up for a Chitter account' do
    expect{sign_up}.to change{User.count}.by(1)
  end

  scenario 'user email is correct in DB' do
    sign_up
    expect(User.first.email).to eq 'rafi@superwoman.com'
  end

end

feature 'user is NOT allowed to sign up when ...' do

  scenario 'user does not provide an email address' do
    expect{sign_up_no_email}.to_not change{User.count}
    expect(current_path).to eq('/user/sign_up')
  end

  scenario 'user tries to use an invalid email' do
    expect{sign_up_invalid_email}.to_not change{User.count}
    expect(current_path).to eq('/user/sign_up')
  end

  scenario 'user does not specify an user name' do
    expect{sign_up_no_username}.to_not change{User.count}
    expect(current_path).to eq('/user/sign_up')
  end

  scenario 'user tries to sign up with the same email' do
    sign_up
    expect{sign_up}.to_not change{User.count}
    expect(current_path).to eq('/user/sign_up')
    expect(page).to have_content("Email is already taken")
  end


end
