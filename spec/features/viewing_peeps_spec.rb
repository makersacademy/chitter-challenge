feature 'Visit chitter page' do
  scenario 'User can view peeps in Chitter' do
    Chitter.create(peep: "It is sunny!")
    Chitter.create(peep: "My head hurts.")
    Chitter.create(peep: "Not bad for a Monday")

    visit('/peeps')

    expect(page).to have_content 'It is sunny!'
    expect(page).to have_content 'My head hurts.'
    expect(page).to have_content 'Not bad for a Monday'
  end
end
