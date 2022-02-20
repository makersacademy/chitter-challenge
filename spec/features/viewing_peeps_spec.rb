feature 'View a list of posted peeps' do
  scenario 'shows all peeps posted in descending chrono-order' do
    visit('/peeps')
    fill_in('peep', with: 'First post')
    click_button('Post')
    fill_in('peep', with: 'Second post')
    click_button('Post')
    expect('First post').to appear_before('Second post')
  end
end