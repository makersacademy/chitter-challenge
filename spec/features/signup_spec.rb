feature 'user sign up' do

  scenario 'user signs up with email and password' do
    sign_up
    expect(page).to have_content ("Hello @SuperRafi")
  end

  scenario 'user can sign up for a Chitter account' do
    expect{sign_up}.to change{User.count}.by(1)
  end

  scenario 'user email is correct in DB' do
    sign_up
    expect(User.first.email).to eq 'rafi@superwoman.com'
  end

end
