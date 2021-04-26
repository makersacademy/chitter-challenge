feature 'See peeps in reverse chronological order' do
  scenario 'A user can see all peeps in reverse chronological order' do
    visit '/peeps/new'
    fill_in('peep', with: 'Hello world')
    click_button('Submit')
    visit '/peeps/new'
    fill_in('peep', with: 'Code')
    click_button('Submit')
    expect(page).to have_selector('li:nth-child(1)', :text => 'Code')
    expect(page).to have_selector('li:nth-child(2)', :text => 'Hello world')
  end
end
