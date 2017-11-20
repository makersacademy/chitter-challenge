feature "index page presents a list of peeps" do
  scenario "form submission sends you to peeps homepage" do
    sign_up_and_post_peep
    expect(page).to have_current_path('/peeps')
  end
  scenario "when posting a new peep it gets shown in index page" do
    sign_up_and_post_peep
    peep = Peep.last
    expect(page).to have_content(peep.message)
  end
  scenario "index page shows the creation date of a peep" do
    sign_up_and_post_peep
    peep = Peep.last
    expect(page).to have_content(peep.created_at.strftime("Peeped on %m/%d/%Y at %I:%M%p"))
  end
  scenario "page has a sign-up button" do
    visit "/"
    expect(page).to have_button("Sign-up")
  end
end
