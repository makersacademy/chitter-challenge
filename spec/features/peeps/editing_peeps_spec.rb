feature "edit" do 
  scenario "user can't edit other users' peeps" do
    log_in
    click_button('New Peep')
    fill_in "body", with: "I am signed up"
    click_button('Post')
    
    peeps = Peep.all.sort_by { |peep| peep.posted_on }.reverse
    first_peep = peeps[0]

    within("div##{first_peep.id}") do
      click_button("Edit")
    end

    fill_in "body",	with: ""
    fill_in "body",	with: "EDITED"
    click_button('Submit Changes')
    expect(page).to have_content('EDITED')
    expect(page).not_to have_content("@kiriarf: I am signed up")
  end

  scenario "user can't edit other users' peeps" do
    log_in
    click_button('New Peep')
    fill_in "body", with: "I am signed up"
    click_button('Post')
    
    peeps = Peep.all.sort_by { |peep| peep.posted_on }.reverse
    last_peep = peeps[-1]

    within("div##{last_peep.id}") do
      expect(page).not_to have_button('Edit')
    end
  end
end