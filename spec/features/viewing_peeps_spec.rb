feature "index page presents a list of peeps" do
  scenario "form submission sends you to peeps homepage" do
    post_peep
    expect(page).to have_current_path('/')
  end
  scenario "when posting a new peep it gets shown in index page" do
    post_peep
    peep = Peep.last
    expect(page).to have_content(peep.message)
  end
end
