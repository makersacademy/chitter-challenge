feature 'User management' do

  def sign_up_as(user) 
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :name, with: user.name
    fill_in :username, with: user.username
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end

  scenario 'User can actually sign up' do
    user = build :user
    expect { sign_up_as(user) }.to change(User, :count).by 1
    expect(page).to have_content "Welcome, #{user.username}"
    expect(User.first.email).to eq "#{user.email}"
  end

  scenario 'Signup requires matching confirmation password' do
    user = build(:user, password_confirmation: 'wrongpassword')
    expect {sign_up_as(user)}.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(status_code).to eq 200
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up with an existing email' do
    user = create :user
    sign_up_as(user)
    expect { sign_up_as(user) }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end


end