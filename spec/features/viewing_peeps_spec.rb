feature "viewing peeps" do
  scenario "it allows you to view a list of peeps" do
    peep_1 = Peep.create(message: "First peep")
    peep_2 = Peep.create(message: "Second peep")
    peep_3 = Peep.create(message: "Third peep")

    visit '/chitter'

    expect(page).to have_content("Third peep")
    expect(page).to have_content("#{peep_3.sent_time}")
    expect(page).to have_content("Second peep")
    expect(page).to have_content("#{peep_2.sent_time}")
    expect(page).to have_content("First peep")
    expect(page).to have_content("#{peep_1.sent_time}")
  end
end
