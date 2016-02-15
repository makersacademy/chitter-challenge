feature 'Users sign up' do

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'user can not sign up with an invalid email' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
  end

  scenario 'user can not sign up with a taken email address' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
  
end
