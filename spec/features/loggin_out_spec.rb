feature 'logged out' do
  scenario 'user logging out ' do
    visit('/chitter')
    click_button("Sign Out")
  end
end