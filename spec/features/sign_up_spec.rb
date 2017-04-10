feature 'User and password' do
  scenario 'sign up and create password' do
    sign_up
    expect(current_path).to eq '/home'
    expect(page).to have_content "Welcome to Chitter! Sam"
    expect(User.count).to eq 1
  end

  scenario 'sign up with two different passwords' do
    visit '/'
    click_button 'Sign up'
    fill_in 'name', with: "Sam"
    fill_in 'email', with: "sam@sam.sam"
    fill_in 'user_name', with: "sammybo1"
    fill_in 'password', with: "sam1"
    fill_in 'confirm_password', with: "sam2"
    click_button "Sign up"
    expect(User.count).to eq 0
  end

  scenario 'user cannot sign up without password validation' do
    visit '/'
    click_button 'Sign up'
    fill_in 'name', with: "Sam"
    fill_in 'email', with: "sam@sam.sam"
    fill_in 'user_name', with: "sammybo1"
    fill_in 'password', with: "sam1"
    fill_in 'confirm_password', with: "sam2"
    click_button "Sign up"
    expect(current_path).to eq '/create_user'
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario 'user cannot sign up without valid email address' do
    visit '/'
    click_button 'Sign up'
    fill_in 'name', with: "Sam"
    fill_in 'email', with: "samsam.sam"
    fill_in 'user_name', with: "sammybo1"
    fill_in 'password', with: "sam1"
    fill_in 'confirm_password', with: "sam1"
    click_button "Sign up"
    expect(current_path).to eq '/create_user'
    expect(page).to have_content("Email has an invalid format")
  end

  scenario 'user cannot sign up with blank email address' do
    visit '/'
    click_button 'Sign up'
    fill_in 'name', with: "Sam"
    fill_in 'email', with: ""
    fill_in 'user_name', with: "sammybo1"
    fill_in 'password', with: "sam1"
    fill_in 'confirm_password', with: "sam1"
    click_button "Sign up"
    expect(current_path).to eq '/create_user'
    expect(page).to have_content("Email must not be blank")
  end

  scenario 'User cannot sign up twice' do
    sign_up
    expect(current_path).to eq '/home'
    click_button 'Sign out'
    expect{sign_up}.to change(User, :count).by(0)
    expect(page).to have_content("Email is already taken")
  end
end
