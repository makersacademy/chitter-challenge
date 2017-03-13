feature 'User sign up' do

  email = "joemaidman@gmail.com"
  handle = "joe"
  email_wrong = "joemaidman@gmail"
  password = "password"
  password_wrong = "password2"

  scenario 'I can sign up as a new user' do
    sign_up(email:email, handle: handle, password: password)
    expect(page).to have_content("#{handle}")
    expect(User.first.email).to eq(email)
    expect(User.count).to eq(1)
  end

  scenario 'User is not signed up if passwords do not match' do
    expect {  sign_up(email:email,
                      handle: handle,
                      password: password,
                      password_confirm: password_wrong)
                    }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'cannot sign-up with an empty email address' do
    expect{ sign_up(email: nil, handle: handle, password: password )}.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

   scenario 'cannot sign-up with an invalid email addres' do
    expect{ sign_up(email: email_wrong, handle: handle, password: password )}.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'cannot create a new account with the same email address' do
    sign_up(email:email, handle: handle, password: password)
    expect{sign_up(email:email, handle: handle, password: password)}.to_not change(User, :count)
    expect(page).to have_content  ('Email is already taken')
  end

end

feature 'User sign in' do

  email = "joemaidman@gmail.com"
  email_wrong = "joemaidman@gmail"
  handle= "joe"
  password = "password"
  password_wrong = "password2"

  let!(:user) do
    User.create(email: email,
                handle: handle,
                bio: "",
                password: password,
                password_confirmation: password)
  end

  scenario 'has correct email and password to login' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "#{user.handle}"
  end

  scenario 'has incorrect email and password to login' do
    sign_in(email: user.email, password: password_wrong)
    expect(page).to have_content "Invalid email address or password"
  end

end

feature 'User sign out' do
  email = "joemaidman@gmail.com"
  handle = "joe"
  email_wrong = "joemaidman@gmail"
  password = "password"
  password_wrong = "password2"

  let!(:user) do
    User.create(email: email,
                bio: "",
                password: password,
                handle: handle,
                password_confirmation: password)
  end

  scenario 'user logs out' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign Out'
    expect(page).to have_content('You have signed-out.')
    expect(page).not_to have_content(email)
  end

end

feature 'User update' do
  email = "joemaidman@gmail.com"
  email_new = "notjoemaidman@gmail.com"
  handle = "joe"
  avatar = "http://www.cats.org.uk/uploads/images/featurebox_sidebar_kids/grief-and-loss.jpg"
  avatar_new = "https://img1.wsimg.com/fos/sales/cwh/8/images/cats-with-hats-shop-06.jpg"
  handle_new = "Not joe"
  bio = "Hi i'm joe!"
  bio_new = "Hi i'm not joe!"
  password = "password"

  let!(:user) do
    User.create(email: email,
                avatar: avatar,
                bio: bio,
                password: password,
                handle: handle,
                password_confirmation: password)
  end

  scenario 'user updates handle and email' do
    sign_in(email: user.email, password: user.password)
    click_button 'Profile'
    click_button 'Update profile'
    fill_in :email,    with: email_new
    fill_in :handle,   with: handle_new
    fill_in :password, with: password
    fill_in :password_confirmation, with: password
    click_button 'Update'
    expect(page).to have_content(email_new)
    expect(page).to have_content(handle_new)
  end

end
