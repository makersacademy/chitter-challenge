feature 'viewing peeps' do
  scenario 'i can create the new peep' do
    visit '/peeps/new'
    fill_in 'message', with: 'my first peep'
    click_button 'create'
    peep = Peep.first
    expect(page).to have_content('my first peep')
  end
end
