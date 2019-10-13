feature 'reading tags' do
  scenario 'user clicks the tag alert button' do
    new_user
    new_user('Ben', 'ben', 'ben@mail.com')
    log_in
    fill_in 'peep-content', with: "@ben tagged"
    click_button 'Peep'
    click_button 'Log out'
    log_in('ben@mail.com')

    click_link 'Tags !'

    expect(page).to have_content "Unread"
    expect(page).to have_content "@ben tagged"
    click_link 'Tags'
    
    expect(page).to_not have_content "Unread"
    expect(page).to have_content "Read"
    expect(page).to have_content "@ben tagged"
  end
end