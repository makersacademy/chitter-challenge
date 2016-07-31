
feature 'User registration' do
  scenario 'User signs-up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, BartJudge@gmail.com')
    expect(User.first.email).to eq('BartJudge@gmail.com')
  end
  scenario  'password confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
end
