feature 'tag alerts' do
  scenario 'user receives a tag alert' do
    new_user
    new_user('Ben', 'ben', 'ben@mail.com')
    log_in
    fill_in 'peep-content', with: "@ben tagged"
    click_button 'Peep'
    click_button 'Log out'
    log_in('ben@mail.com')

    expect(page).to have_content "Tags !"
  end
end
