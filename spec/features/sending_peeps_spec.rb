feature 'sending a peep' do
  scenario 'sends a peep' do
    Peep.create(text: 'My First Peep')
    visit '/homepage'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
    expect(page).to have_content('My First Peep')
    end
  end
   scenario 'user can send a tweet' do
    visit '/new-peep'
    fill_in('peep', with: 'My Second Peep')
    click_button('Peep!')
    expect(page).to have_content('My Second Peep')
  end
end
