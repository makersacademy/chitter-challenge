feature 'Writing a new peep' do
  scenario 'A user can peep' do
    visit('/new_peep')
    fill_in('peep', with: 'What?')
    click_button('Submit')

    expect(page).to have_content 'What?'
  end
end
