feature 'Signing In' do
  before do
    User.create(name: 'Sample', email: 'sample@email.com',
      username: 'sample1235', password: 'password1234',
      password_confirmation: 'password1234')
  end

  scenario 'can sign in' do
    sign_in
    expect(page).to have_content "Sample"
  end
end