feature 'Signing up' do
  scenario 'I can sign up for an account' do
    visit '/sign_up'
    expect(page.status_code).to eq 200
    fill_in(:name, with: 'Sample')
    fill_in(:email, with: 'sample@email.com')
    fill_in(:username, with: 'sample1234')
    fill_in(:password, with: 'password1234')
    click_button('Sign Up')
    expect(User.first.name).to eq 'Sample'
    expect(page).to have_content('sample1234')
  end
end
