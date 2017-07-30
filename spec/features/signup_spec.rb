feature 'FEATURE: signing up' do
  scenario 'User can sign up for account' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome! A new user account has been created for Bobby'
  end

  scenario 'I cannot sign up without entering an email' do
  expect { sign_up(email: nil) }.not_to change(User, :count)
  expect(page).to have_content 'Email must not be blank'
end

scenario 'I cannot sign up using an invalid email address' do
  expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  expect(page).to have_content 'Email has an invalid format'
end

scenario 'I cannot sign up using an already registered email address' do
  sign_up
  expect { sign_up }.not_to change(User, :count)
  expect(page).to have_content 'Email is already taken'
end

scenario 'I cannot sign up if I enter the wrong password confirmation' do
  expect { sign_up(password_confirmation: 'xyz')}.not_to change(User, :count)
end
end
