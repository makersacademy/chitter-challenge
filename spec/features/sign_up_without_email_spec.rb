feature 'missing email' do
  scenario 'no email address entered' do
    sign_up_with_missing_email
    expect(page).to have_content 'Email must not be blank'
    expect(User.count).to eq 0
  end
end
