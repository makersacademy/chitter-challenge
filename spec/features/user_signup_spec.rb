feature 'Signup' do
  scenario 'user can signup' do
    sign_up
    expect(page).to have_content('Welcome, jo@gmail.com')
  end
end
