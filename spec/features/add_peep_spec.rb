feature 'creating a new peep' do
  scenario 'user can post a new peep' do
    visit '/new_peep'
    fill_in :message, with: 'Welcome to Makers Academy'
    click_button('Peep!')

    expect(page).to have_content 'Welcome to Makers Academy'
  end
end
