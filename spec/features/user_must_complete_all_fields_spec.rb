feature 'user fill in all fields at signup' do

  scenario 'user must fill in name' do
    expect { user_sign_up(nil, "user123", "uses@user.com", 'password123', 'password123') }.not_to change(User, :count)
    expect(page).to have_content('Name must not be blank')
  end

  scenario 'user must fill in username' do
    expect { user_sign_up('user', nil, "user@user.com", 'password123', 'password123') }.not_to change(User, :count)
    expect(page).to have_content('User name must not be blank')
  end

  scenario 'user must fill in email address' do
    expect { user_sign_up('user', "user123", nil, 'password123', 'password123') }.not_to change(User, :count)
    expect(page).to have_content('Email address must not be blank')
  end

end
