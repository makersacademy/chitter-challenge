feature 'See peeps in reverse chronological order' do
  scenario 'A user can see all peeps in reverse chronological order' do
    sign_up
    add_first_peep
    fill_in('peep', with: 'Code')
    click_button('Submit')
    expect(page).to have_selector('li:nth-child(1)', :text => 'Code')
    expect(page).to have_selector('li:nth-child(2)', :text => 'Hello world')
  end
end
