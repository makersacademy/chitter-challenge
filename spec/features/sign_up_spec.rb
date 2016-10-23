feature 'User sign up' do

  scenario 'user is saved in database' do
    expect{ sign_up }.to change( User, :count ).by(1)
    expect(page).to have_content "Welcome Mickey-boy"
    expect(User.first.email).to eq ('mike@mike.com')
  end

  scenario "can't sign up with blank email" do
    expect{sign_up(email: nil)}.not_to change(User, :count)
    expect(page).to have_content "Email must not be blank"
  end

  scenario "can't sign up with invalid email" do
    expect{sign_up(email: 'wrong@email')}.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario "can't sign up with duplicate email" do
    sign_up
    expect{sign_up}.not_to change(User, :count)
    expect(page).to have_content "Email is already taken"
  end
end
