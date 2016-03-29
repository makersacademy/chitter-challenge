feature 'Using text messages' do
  scenario 'Optional field for adding phone number' do
    visit '/signup'
    expect(page).to have_field("phone")
  end

  scenario 'Adds phone number to User in database' do
    sign_up_with_phone
    expect(User.count).to eq 1
    user = User.first
    expect(user.phonenumber).to eq "+447709344456"
  end

end
