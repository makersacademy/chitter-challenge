feature 'Adding a new chit' do
  scenario 'user posts a chit and can view it' do
    visit('/')
    click_button('new')
    fill_in 'peepbody', with: 'Chitter is awesome!'
    expect { click_button 'submit' }.to change(Peep, :count).by(1)
    expect(page).to have_content('Chitter is awesome!')
  end
end
