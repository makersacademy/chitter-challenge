feature "signing up to chitter" do
  scenario "A user can enter their details" do
    visit('/sign_up')
    fill_in('username', with: 'leoncross')
    fill_in('name', with: 'leon')
    fill_in('email', with: 'leon@email.com')
    fill_in('password', with: '12345')
    click_button 'Submit'
    expect(page).to have_content 'Thank you for signing up!'
  end
end
