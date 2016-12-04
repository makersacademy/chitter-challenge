feature 'duplicate email' do
  scenario 'I should not be able to sign up with an email that is already in use' do
    expect{duplicate_email}.to change{User.count}.by 1
    expect(page).to have_content('Email is already taken')
  end
end
