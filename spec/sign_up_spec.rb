
feature 'sign up' do
  scenario 'allows user to sign up for chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, joe_bloggs@gmail.com')
    expect(User.first.email).to eq('joe_bloggs@gmail.com')
  end

  scenario 'requires a matching password for confirmation' do
    expect {sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario 'user must enter a valid email' do

  end
end
