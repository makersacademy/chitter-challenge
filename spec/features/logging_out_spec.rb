feature 'Logging out' do
  scenario 'is possible' do
    create_account
    click_button 'Log out'
    expect(page).to have_selector(:link_or_button, 'Log in')
    expect(page).not_to have_content('rgoll')
  end
end
