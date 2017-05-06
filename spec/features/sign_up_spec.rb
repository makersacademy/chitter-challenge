feature 'Sign up to Chitter' do
  scenario 'User submits form to sign up to Chitter' do
    visit '/signup'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: 'jessica@email.com'
    fill_in :password, with: 'jessica'
    click_button 'Sign up'
    expect(page.status_code).to eq 200
  end
end
