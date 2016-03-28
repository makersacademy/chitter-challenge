feature 'SignUp' do
  
  before :each do
    User.create(name: "town", email:"town@girl.com", 
    username:"town_girl", password_hash:"1234")
  end


  scenario 'A user can sign up' do
    expect{signup("Factory", "factory_girl", "factory@girl.com", 
    "1234", "1234")}.to change{User.count}.by(1)

    expect(current_path).to eq '/feed'
    expect(page).to have_content("Welcome Factory")
  end


  scenario 'User is not created if passwords dont match' do
    expect{signup("Factory", "factory_girl", "factory@girl.com", 
    "1234", "123")}.to_not change{User.count}

    expect(current_path).to eq '/user/signup'
    expect(page).not_to have_content("Welcome Factory")
    expect(page).to have_content("Password does not match the confirmation")
  end


  scenario 'User is not created if email invalid' do
    expect{signup("Factory","factory_girl", "factorygirl.com", 
    "1234", "1234")}.to_not change{User.count}

    expect(current_path).to eq '/user/signup'
    expect(page).not_to have_content("Welcome Factory")
    expect(page).to have_content("Email has an invalid format")
  end

  scenario 'User is not created if email already exists' do

    expect{signup("Factory", "factory_girl", "town@girl.com", "1234", "1234")}.to_not change{User.count}
    expect(current_path).to eq '/user/signup'
    expect(page).not_to have_content("Welcome Factory")
    expect(page).to have_content("Email is already taken")
  end

  scenario 'User is not created if username already exists' do

    expect{signup("Factory","town_girl", "factory@girl.com", "1234", "1234")}.to_not change{User.count}
    expect(current_path).to eq '/user/signup'
    expect(page).not_to have_content("Welcome Factory")
    expect(page).to have_content("Username is already taken")
  end
end
