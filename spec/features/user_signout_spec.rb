feature 'User signing out' do

  scenario 'executes and confirms action of signing out' do

    sign_up
    sign_in
    click_button 'Log Out'
    expect(page).to have_content('Goodbye Ben.')
    expect(page).not_to have_content('Welcome Ben.')

  end

end
