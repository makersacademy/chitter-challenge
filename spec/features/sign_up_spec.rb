feature 'sign up' do
  scenario 'page has form to sign up' do
    visit '/'
    expect(page).to have_field 'username'
    expect(page).to have_field 'email'
    expect(page).to have_button 'sign in'
  end

  scenario 'welcomes user after signing up' do
    sign_in
    expect(page).to have_content 'Welcome, Jazzy'
  end
end
