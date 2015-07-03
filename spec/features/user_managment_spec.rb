require './spec/features/login'
feature 'user sign up' do
  include Login
  scenario 'I can sign up as a new user' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, faisal')
    expect(User.first.email).to eq('faisal@gmail.com')
  end
end
