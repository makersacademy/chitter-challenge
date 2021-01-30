feature 'Viewing peeps' do
  scenario 'shows all peeps' do
    Peep.create(message: 'This is my first peep', time_last_altered: Time.now)
    Peep.create(message: 'Second post', time_last_altered: Time.now)
    Peep.create(message: "C`est ma troisieme poste", time_last_altered: Time.now)

    visit '/feed'

    expect(page).to have_content('This is my first peep')
    expect(page).to have_content('Second post')
    expect(page).to have_content("C`est ma troisieme poste")
  end
end