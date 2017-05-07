feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello! example123')
    expect(User.first.email).to eq('example@email.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { incorrect_sign_up }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Passwords do not match'
  end

end
