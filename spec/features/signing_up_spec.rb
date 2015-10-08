feature "User sign up" do

  def sign_up(name:                  'Person',
              username:              'pers0n',
              email:                 'person@example.com',
              password:              'bananas!',
              password_confirmation: 'bananas!')
    visit 'users/sign_up'
    expect(page.status_code).to eq(200)
    fill_in :name,                  with: name
    fill_in :username,              with: username
    fill_in :email,                 with: email
    fill_in :password,              with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up for Chitter'
  end

# #--> FactoryGirl refactoring
# def sign_up_as(user)
#   visit 'users/sign_up'
#
#   fill_in :name,                  with: user.name
#   fill_in :username,              with: user.username
#   fill_in :email,                 with: user.email
#   fill_in :password,              with: user.password
#   fill_in :password_confirmation, with: user.password_confirmation
#   click_button 'Sign up for Chitter'
# end

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello, pers0n.')
    expect(User.first.username).to eq('pers0n')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'returns an error when a password does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq ('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'requires an email' do
    expect { sign_up(email: '') }.not_to change(User, :count)
  end

  scenario 'requires a valid email address' do
    expect { sign_up(email: 'test') }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('We already have that email.')
  end

end



# feature "User sign in" do
#
#   def sign_in(username: 'pers0n',
#               password: 'bananas!')
#     visit 'users/sign_in'
#     expect(page.status_code).to eq(200)
#     fill_in :username, with: username
#     fill_in :password, with: password
#     click_button 'Log in'
#   end
#
#   scenario 'I can sign in as a user' do
#     expect { sign_in }.to change(User, :count).by(1)
#     expect(page).to have_content('Hello, pers0n.')
#     expect(User.first.username).to eq('pers0n')
# #   end
#
# end
