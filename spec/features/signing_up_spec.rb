feature "User sign up" do

  def sign_up(name: 'Person',
              username: 'pers0n',
              email: 'person@example.com',
              password: 'bananas!',
              password_confirmation: 'bananas!')
    visit 'users/sign_up'
    expect(page.status_code).to eq(200)
    fill_in :name,     with: name
    fill_in :username, with: username
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up for Chitter'
  end

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello, pers0n.')
    expect(User.first.username).to eq('pers0n')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
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
