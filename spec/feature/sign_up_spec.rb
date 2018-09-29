feature 'sign up' do
  scenario 'user can sign up' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, AlbusD!')
    expect(User.first.email).to eq('albus_dumbledore@hogwarts.co.uk')
  end

  scenario 'require matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
end
