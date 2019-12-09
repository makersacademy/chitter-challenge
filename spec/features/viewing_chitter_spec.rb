feature 'Viewing Chitter' do
  scenario 'A user can view the peeps' do

    p1 = Peep.create(message: "Henlo friend")
    t1 = p1.time
    d1 = p1.date
    p2 = Peep.create(message: "Coding is fun")
    t2 = p2.time
    d2 = p2.date
    p3 = Peep.create(message: "Just kidding :)")
    t3 = p3.time
    d3 = p3.date

    visit('/peeps')

    expect(page).to have_content("Henlo friend, #{d1}, #{t1} Coding is fun, #{d2}, #{t2} Just kidding :), #{d3}, #{t3}")
  end
end
