feature 'SignUp' do
  scenario 'A user can sign up' do
    expect{signup("Factory", "factory@girl.com", 
    "1234", "1234")}.to change{User.count}.by(1)
    expect(current_path).to eq '/feed'
    expect(page).to have_content("Welcome Factory")
  end


  scenario 'User is not created if passwords dont match' do
    expect{signup("Factory", "factory@girl.com", 
    "1234", "123")}.to_not change{User.count}
    expect(current_path).to eq '/user/signup'
    expect(page).not_to have_content("Welcome Factory")
    expect(page).to have_content("Password does not match the confirmation")
  end


  scenario 'User is not created if email invalid' do
    expect{signup("Factory", "factorygirl.com", 
    "1234", "1234")}.to_not change{User.count}
    expect(current_path).to eq '/user/signup'
    expect(page).not_to have_content("Welcome Factory")
    expect(page).to have_content("Email has an invalid format")
  end

  scenario 'User is not created if user exists' do
    User.create(name: "Factory", 
    email:"factory@girl.com", 
    password_hash:"1234")
    expect{signup("Factory", "factory@girl.com", 
    "1234", "1234")}.to_not change{User.count}
    expect(current_path).to eq '/user/signup'
    expect(page).not_to have_content("Welcome Factory")
    expect(page).to have_content("Email is already taken")
  end
end
