feature 'User sign up' do

  let (:user) do
    build :user
  end

  scenario 'can signup as new user' do
    expect { sign_up user }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome #{user.username}"
  end

  scenario 'with a password that does not match' do
    expect { sign_up(build :user, password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/user'
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario ' I cannot sign up with an existing email' do
    sign_up user
    expect { sign_up user }.to change(User, :count).by(0)
    expect(page).to have_content 'Email is already taken'
  end

end

# feature 'User sign in' do
#
#   scenario 'can log in' do
#     sign_in user
#     expect(page).to have_content "Welcome back, #{user.username}"
#   end
#
# end
