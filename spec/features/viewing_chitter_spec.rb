feature 'Viewing Chitter' do
  scenario 'A user can view the peeps' do

    Peep.create(message: "Henlo friend")
    Peep.create(message: "Coding is fun")
    Peep.create(message: "Just kidding :)")

    visit('/peeps')

    expect(page).to have_content("Henlo friend Coding is fun Just kidding :)")
  end
end
