
feature 'signing up' do

  scenario 'user visits sign up page and enters correct details' do
    sign_up(name:'user',email:'user@email.com',password:'password',
    password_confirmation:'password')
    users = User.all
    user = User.first
    expect(users.count).to eq(1)
    expect(user.email).to eq 'user@email.com'
    expect(page).to have_content("user, you are logged in")
  end

  scenario 'user signs up and types two different passwords' do
    sign_up(name:'user',email:'user@email.com',password:'password',
    password_confirmation:'mistyped password')
    user = User.first
    expect(user).to eq nil
    expect(page).to have_content("Password does not match the confirmation")

  end

  scenario 'A user does not submit an email address' do
    visit '/users/new'
    fill_in('name', with: 'user')
    fill_in('email', with: nil)
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    expect { click_button('Sign up') }.not_to change(User, :count)
    expect(page).to have_content("Email must not be blank")
  end

  scenario 'A user submits an incorrectly formatted email' do
    visit '/users/new'
    sign_up(name:'user',email:'not fomatted correctly',password:'password',
    password_confirmation:'password')
    user = User.first
    expect(user). to eq nil
  end

  scenario 'A user signs up with already registered email' do
    User.create(name: 'user', email: 'user@email.com', password: 'password', password_confirmation: 'password')
    visit '/users/new'
    fill_in('name', with: 'user')
    fill_in('email', with: 'user@email.com')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    expect{click_button('Sign up')}.not_to change(User, :count)
    expect(page).to have_content("Email is already taken")
  end


end
