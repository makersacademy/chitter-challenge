feature 'User signs up' do
  scenario 'as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, somealex')
    expect(User.first.name).to eq('alex')
    expect(User.first.user_name).to eq('somealex')
    expect(User.first.email).to eq('alex@example.com')
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
end
end
