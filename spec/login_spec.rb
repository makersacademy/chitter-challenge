feature 'Log in' do
  scenario 'test login works, redirects to /peeps' do
    visit '/'
    fill_in 'username', with: "Test987"
    fill_in 'password', with: "password987"
    click_button "Log In"
    expect(current_path).to eq "/peeps"
  end
end