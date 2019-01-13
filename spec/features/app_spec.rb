feature 'homepage' do
  scenario 'expect homepage to have header, textbox and submit button' do
    visit('/')
    expect(page).to have_content "Chitter"
    expect(page).to have_content "Sign up"
    expect(page).to have_content "Sign in"
    expect(page.current_path).to eq '/'
  end

  scenario 'A user can signup' do
    signup
    expect(page).to have_content 'You signed up successfully!'
    expect(page).to have_content 'Welcome, test@test.com'
  end
end
