feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit '/peeps'

    expect(page).to have_content("CHITTER")
  end

  scenario 'user can view peeps' do
    first_peep = Peep.send(message: "First peep")
    second_peep = Peep.send(message: "Second peep")
    third_peep = Peep.send(message: "Third peep")

    visit '/peeps'

    expect(page).to have_content("Third peep")
    expect(page).to have_content("#{third_peep.sent_time}")
    expect(page).to have_content("Second peep")
    expect(page).to have_content("#{second_peep.sent_time}")
    expect(page).to have_content("First peep")
    expect(page).to have_content("#{first_peep.sent_time}")
  end
end
