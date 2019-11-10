feature 'Adding a new peep' do
  scenario ' A user can add a new peep to chitter' do
    visit ('/peeps/new')
    fill_in('text', with: 'Have a good weekend')
    click_button('Submit')

    expect(page).to have_content 'Have a good weekend'
  end
end
