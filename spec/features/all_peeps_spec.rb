feature 'all peeps' do
  scenario 'shows all of the users peeps' do
    visit '/peeps'
    expect(page).to have_button('new_peep')
  end

  scenario 'shows the time at which each peep was posted' do
    visit '/peeps/new_peep'
    fill_in :text, with: 'Test peep'
    click_button 'Post'
    expect(page).to have_content('Posted at: ')
  end

end
