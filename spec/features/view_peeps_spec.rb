feature "View Peeps" do
  scenario "it displays the content of an added peep" do
    add_peep
    expect(page).to have_content("my first peep")
  end
  scenario "it displays the time of an added peep" do
    time = Time.now.strftime("%I:%M %p")
    add_peep
    expect(page).to have_content(time)
  end
end
