feature 'View a list of posted peeps' do
  scenario 'shows all peeps posted in descending chrono-order' do
    visit('/peeps')
    fill_in('peep', with: 'First post')
    click_button('Post')
    fill_in('peep', with: 'Second post')
    click_button('Post')
    expect('First post').to appear_before('Second post')
  end

  scenario 'shows the time stamp of when the peep was posted' do
    visit('/peeps')
    fill_in('peep', with: 'Time test')
    click_button('Post')
    expect(page).to have_content Time.now.strftime("%H:%M:%S")
  end
end