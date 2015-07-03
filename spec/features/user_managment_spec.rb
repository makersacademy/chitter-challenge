require './spec/features/login'
feature 'user sign up' do
  include Login
  scenario 'I can sign up as a new user' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, faisal')
    expect(User.first.email).to eq('faisal@gmail.com')
  end

  scenario 'requires a matching confirmation password' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
  end

  scenario 'does not redirect when passwords dont match' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Passwords do not match'
  end
end
