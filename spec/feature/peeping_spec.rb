feature 'peeping' do
  scenario 'user can peep when logged in' do
    sign_up
    click_button 'Peep!'
    fill_in 'peep', with: 'To the well-organized mind, death is but the next great adventure.Albus Dumbledore'
    click_button 'Peep!'
    expect(current_path).to eq '/'
    expect(page).to have_content('To the well-organized mind, death is but the next great adventure.Albus Dumbledore')
  end

  scenario "user can't peep if not logged in" do
    visit '/'
    expect(page).not_to have_content 'Peep!'
  end
end
