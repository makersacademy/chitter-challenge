feature 'Viewing list of Peeps' do
  scenario 'User can see a list of Peeps' do
    # Using create method in Peep class (with argument as text strings)
    Peep.create(peep: 'This is my first ever Peep!')
    Peep.create(peep: "This is me saying something inspirational.")
    Peep.create(peep: "I am upset about politics right now!")
    # Visit index page, where .all method in Peep class outputs the three created Peeps
    visit('/')
    expect(page).to have_content 'This is my first ever Peep!'
    expect(page).to have_content "This is me saying something inspirational."
    expect(page).to have_content "I am upset about politics right now!"
  end
end
