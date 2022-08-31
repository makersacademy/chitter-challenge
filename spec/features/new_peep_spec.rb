feature 'Adding new Peep' do
  scenario 'A user can add a new Peep to the Feed' do
    visit ('/peeps')
    fill_in('content', with: 'Test Peep')
    click_button('Submit')

    expect(page).to have_content 'Test Peep'
  end
end 
