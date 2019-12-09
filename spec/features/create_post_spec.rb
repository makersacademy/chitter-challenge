feature 'Adding a new peep' do
  scenario 'user can add a message to chitter' do
    visit('/chitter')
    chitter = Chitter.create(message: '1st post')
    click_button('Submit')

    expect(page).to have_content('1st post', chitter.date)
  end
end
