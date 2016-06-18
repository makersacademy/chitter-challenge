feature 'Signing up' do
  scenario 'singing in a new user' do
    expect{ sign_up }.to change(User, :count).by(1)
  end

  scenario 'failing password confirmation' do
    expect{ sign_up(password_confirmation: '4321') }.not_to change(User, :count)
  end
end
