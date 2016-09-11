feature 'Chitter signup' do
  scenario 'Users can signup to Chitter to start peeping' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello marsu!')
    expect(User.first.email).to eq('marsupilami@marsu.com')
  end

  scenario 'Abord user sign up when password and password_confirmation mismatch' do
    expect{ sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario 'Abord user sign up when email address is missing' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Please fill in a valid email address')
  end

  scenario 'Abord user sign up when invalid email address is given' do
    expect { sign_up(email: "marsu@invalid") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Invalid email address')
  end

  scenario 'Abord user sign up when existing email is given' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email address already registered')
  end
end
