
feature 'Create chitter' do
  scenario 'can display chitter submission form' do
    visit('/create_chitter')
    expect(page).to have_field('content', type: 'text')
    expect(page).to have_field('name', type: 'text')
    expect(page).to have_button('submit')
  end
end