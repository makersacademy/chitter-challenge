feature 'a user can sign up for Chitter' do
  scenario 'users can sign up with a name, email and password' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, @codey_mc_code_face')
    expect(User.first.email).to eq('chazzas@hotmail.com')
  end
  scenario 'requires a matching password' do
    expect { sign_up(password_confirmation: 'mistake') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Passwords must match. Please try again.'
  end
  scenario 'user unable to sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end
end
