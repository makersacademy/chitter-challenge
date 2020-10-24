feature 'Adding a new peep' do
  scenario 'a user can add a peep onto chitter' do
<<<<<<< HEAD
    PG.connect(dbname: 'chitter_test')
=======
    connection = PG.connect(dbname: 'chitter_test')
>>>>>>> dab571213c8f9abdec2809f7e4d02f6c10cfe18e
    visit '/chitter'
    fill_in 'post', with: 'Breaking peep!!'
    click_button 'Peep'

    expect(page).to have_content('Breaking peep!!')
  end
end
