feature 'Sign up' do
  scenario '> user count should increase and a personalised welcome message shown' do
    expect{sign_up_correctly}.to change{User.count}.by 1
    expect(page).to have_content 'Welcome Marty!'
  end

  scenario '> cannot sign up if password mismatches password confirmation' do
  expect{sign_up_mismatch_passwords}.to change{User.count}.by 0
  expect(page).to have_content "Password does not match the confirmation"
  expect(User.all).to be_empty
  end

  scenario '> should keep username and email filled in if not signed up correctly' do
  sign_up_mismatch_passwords
  expect(page).to have_selector('input[value="martymcfly@future.com"]')
  expect(page).to have_selector('input[value="Marty"]')
  end

  scenario '> cannot sign up if email left empty' do
  expect{sign_up_no_email}.to change{User.count}.by 0
  expect(page).to have_content "Email must not be blank"
  end

  scenario '> will not accept invalid email' do
  expect{sign_up_invalid_email}.to change{User.count}.by 0
  expect(page).to have_content "Email has an invalid format"
  end

  scenario '> user cannot sign up twice with the same email' do
  expect{sign_up_same_email}.to change{User.count}.by 1
  expect(page).to have_content "Email is already taken"
  end
end
