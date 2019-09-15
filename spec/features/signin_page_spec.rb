feature 'sign-in page' do
  scenario 'a user can enter their details to join Chitter' do
    visit '/join'
    fill_in('handle', with: 'chitter1')
    fill_in('password', with: 'secret4567')
    fill_in('confirmation', with: 'secret4567')
    click_button('Submit')
    expect(page).to have_content('Latest Peeps:')
  end
end
