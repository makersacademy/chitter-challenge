feature 'creating peeps' do
  scenario 'peep is less than 140 characters' do
    visit('/peeps')
    click_link('New peep')
    fill_in('peep', with: 'My first peep')
    click_button('Submit')
    expect(page).to have_current_path('/peeps')
    expect(page).to have_text('My first peep')
  end
end
