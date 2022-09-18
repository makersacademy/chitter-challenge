feature 'posting peep' do
  scenario 'A user can post a peep to Chitter' do
    visit('/chitter/new')
    fill_in('peep', with: 'Hello from user1')
    click_button('Post')

    expect(page).to have_content 'Hello from user1'
  end
end