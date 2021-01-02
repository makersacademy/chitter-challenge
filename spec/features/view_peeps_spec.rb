feature "View Peeps" do
  scenario "it displays the content of an added peep" do
    sign_up("adam")
    add_peep1
    expect(page).to have_content("my first peep")
  end
  scenario "it displays the time of an added peep" do
    time = Time.now.strftime("%I:%M %p")
    sign_up("adam")
    add_peep1
    expect(page).to have_content(time)
  end
  # scenario "it displays the peeps in reverse chronological order" do
  #   add_peep1
  #   add_peep2
  #   add_peep3
  #   expect
  # end
end
