feature 'registration' do
  scenario 'a user can sign up' do
    visit('/users/new')
    fill_in('email', with: 'peeping@peepers.com')
    fill_in('password', with: 'SuperSecretPassword123')
    click_button('Submit')

    expect(page).to have_content "Get Peeping, peeping@peepers.com"
  end
end
