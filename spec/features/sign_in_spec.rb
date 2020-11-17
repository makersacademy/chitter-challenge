feature 'user sign in' do
  scenario 'existing user can sign in' do
    sign_in
    expect(page).to have_content 'Welcome, ralphm10'
  end
end
