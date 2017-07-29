feature 'posting peeps' do
  scenario 'user can post a peep' do
    visit '/peeps/new'
    fill_in :content, with: 'Peeping, peeping, 123'
    click_button 'Peep this'
    visit '/peeps'
    expect(page).to have_content 'Peeping, peeping, 123'
  end
end
