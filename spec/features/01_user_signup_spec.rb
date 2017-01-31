# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature '01. User Signup' do
  scenario 'a) user is able to create account' do
    user_signup
    expect(current_path).to eq("/peeps")
  end

  scenario 'b) when user successfully creates their account they will see their name' do
    user_signup
    expect(page).to have_text("Jose Pedro Castanheira")
  end

  scenario 'c) after signup users database will count one more' do
    expect{ user_signup }.to change{ User.count }.by(1)
  end

  scenario 'd) email is unique in the database' do
   user_signup
   expect{user_signup}.to change(User, :count).by(0)
  end

  scenario 'e) email format is wrong' do
    visit '/users/new'
    fill_in(:email, with: 'lauren')
    fill_in(:password, with: '1234')
    fill_in(:password_confirmation, with: '1234')
    expect{click_button("Sign up")}.to change(User, :count).by(0)
  end

  scenario 'f) email is empty' do
    visit '/users/new'
    fill_in(:password, with: '1234')
    fill_in(:password_confirmation, with: '1234')
    expect(current_path).to eq('/users/new')
  end

  scenario 'g) an error message is displayed to the user' do
   user_signup
   user_signup
   expect(page).to have_text("The inserted email is already registered. Choose a different one.")
  end

  scenario 'h) password confirmation not matching password' do
    visit '/users/new'
    fill_in(:username, with: "pedrocastanheira")
    fill_in(:password, with: "correct_password")
    fill_in(:password_confirmation, with: "wrong_password")
    click_button("Sign up")
    expect(page).to have_text("Password does not match the confirmation")
  end
end
