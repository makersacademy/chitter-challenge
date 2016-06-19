feature "Peep creation" do
  let(:peep_text) { "Example peep" }
  let(:long_peep_text) do
    "Bacon ipsum dolor amet strip steak shank hamburger meatloaf flank rump "\
    "ball tip prosciutto tongue. Shankle pastrami porchetta tri-tip ham "\
    "meatball capicola bresaola filet mignon pork belly hamburger pancetta "\
    "ribeye venison."
  end

  scenario "user can post a new peep when logged in" do
    create_user
    log_in
    visit("/peeps/new")
    fill_in(:text, with: peep_text)
    click_button(:Peep)

    within ".timeline" do
      expect(page).to have_content(peep_text)
    end
  end

  scenario "user can't post a peep longer than 140 chars" do
    create_user
    log_in
    visit("/peeps/new")
    fill_in(:text, with: long_peep_text)
    click_button(:Peep)
    expect(page).to have_content("Text must be at most 140 characters long")
  end
end
