feature 'Creating a new peep' do
  scenario 'A user can add a peep to Chitter Manager' do
    visit ('/peeps/new')
    fill_in('message', with: 'My first peep')
    click_button('Submit')

    expect(page.status_code).to eq 200
    expect(page).to have_content 'My first peep'
  end
end
