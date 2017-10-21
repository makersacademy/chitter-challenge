feature 'Signing up' do
  scenario 'user is able to create account' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter, Ed Lowther'
  end
end
