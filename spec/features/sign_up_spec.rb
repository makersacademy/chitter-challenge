feature 'able to sign up' do
  scenario 'visit website' do
    visit('/')
    expect(page).to have_content('Please sign up to Peeper')
  end
  scenario 'signed up' do
    visit('/')
    sign_up('user', 'user@gmail.com')
    expect(page).to have_content('Welcome to Peeper')
  end
end
