feature 'view peeps in reverse chronological order' do
  scenario 'visiting the /chitter page ' do
    Chitter.create(peep: 'Cats can peep too', time: Time.new(2020, 1, 3, 22, 0))
    Chitter.create(peep: 'Dogs can peep too', time: Time.new(2020, 1, 3, 22, 40))
    visit('/chitter')
    expect(page).to have_selector("ul li:first-child", text: "Dogs can peep too")
    expect(page).to have_selector("ul li:last-child", text: "Cats can peep too")
  end

  scenario 'see the peep time' do
    Chitter.create(peep: 'Cats can peep too', time: Time.new(2020, 1, 3, 22, 0))
    visit('/chitter')
    expect(page).to have_content('22:00, 03.01.2020')
  end
end
