
feature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    fill_in('name', with: 'Muge Hasilci')
    fill_in('email', with: 'muge.hasilci@hotmail.com')
    fill_in('username', with: 'artemis')
    fill_in('password', with: 'kizkulesi')
    click_button('Register')
    expect(page).to have_content "Welcome, muge.hasilci@hotmail.com"
  end
end
