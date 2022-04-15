feature 'Post Peep' do
  scenario 'User can write a Peep that can be seen on Chitter' do
    visit('/')
    click_button('New Peep')
    fill_in :peep, with: "Hey guys! I'm new"
    click_button('Peep!')
    expect(page).to have_content("Hey guys! I'm new")
  end

  scenario 'User can see the time the Peep was created' do
    visit('/')
    click_button('New Peep')
    fill_in :peep, with: "Hey guys! I'm new"
    click_button('Peep!')
    expect(page).to have_content(Date.today)
  end
end
