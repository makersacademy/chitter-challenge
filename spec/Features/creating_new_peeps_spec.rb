feature 'Adding a new peep' do
  scenario 'user posts a peep and can view it' do
    visit('/')
    click_button('new peep')
    fill_in 'peepbody', with: 'My first peep!'
    expect { click_button 'submit' }.to change(Peep, :count).by(1)
    expect(page).to have_content('My first peep!')
  end
end
