feature 'you can sign up to chitter' do
  scenario 'Darth Vader signs up as new user' do
    sign_up
    expect(page).to have_content 'Welcome, darth@empire.com'
  end

scenario 'Darth Vader tries to sign up with the wrong password' do
  expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
       expect(page).to have_content 'Password and confirmation password do not
       match'
    end
end
