feature 'posting peeps' do
  scenario 'registered users can post peeps' do
    visit '/peeps/new'

    fill_in('new_peep', with: 'Betis - Real Madrid today!')
    click_button 'Publish peep'

    expect(page).to have_content 'Betis - Real Madrid today!'
  end
end
