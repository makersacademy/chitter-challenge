feature 'make peeps' do
  scenario 'user wants to make a peep' do
    visit ('/peeps')
    fill_in('make_peep', with: 'first peep')
    click_button('Submit')
    expect(page).to have_content('first peep')
  end
end