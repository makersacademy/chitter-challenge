feature 'Posting a new peep' do
  scenario 'displays sign in page' do
    visit '/chitter'
    click_on 'New peep'
    expect(page).to have_content('Text')
  end
end
