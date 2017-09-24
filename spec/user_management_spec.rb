feature 'Sign up' do
  scenario 'user can create an account' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, tester!')
    expect(User.first.email).to eq('test@test.com')
  end

  scenario 'password confirmation must match' do
    expect { sign_up(password_confirmation: 'wrong_confo') }.not_to change(User, :count)
    expect(page).to have_content('Passwords do not match')
  end
end
