# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "Users can sign up for Chitter" do
  scenario "Users can fill out a form and sign up" do
    expect{sign_up}.to change(User, :count).by 1
    expect(page).to have_content "Welcome to Chitter David"
    expect(User.first.email).to eq 'parry@gmail.com'
  end

  scenario "Users cannot sign up without an email address" do
    visit '/home'
    click_button('Sign up')
    fill_in('name', with: 'David')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    expect{click_button('Submit')}.not_to change(User, :count)
    expect(page).to have_content "Email must not be blank"
  end


  scenario "Users cannot set up without a valid email address" do
    visit '/home'
    click_button('Sign up')
    fill_in('name', with: 'David')
    fill_in('email', with: 'drjparrygmail.com')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    expect{click_button('Submit')}.not_to change(User, :count)
    expect(page).to have_content "Email has an invalid format"
  end

  scenario "Users can only register is password is confirmed" do
    visit '/home'
    click_button('Sign up')
    fill_in('name', with: 'David')
    fill_in('email', with: 'drjparry@gmail.com')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'apples')
    expect{click_button('Submit')}.not_to change(User, :count)
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "Users cannot sign up with an existing email" do
    sign_up
    expect{sign_up}.not_to change(User, :count)
    expect(page).to have_content "Email is already taken"
  end

end
