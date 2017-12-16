feature "Viewing the message box" do
  scenario "I can view the message box" do
    visit("/peeps/new")
    expect(page).to have_selector("textarea")
  end

  scenario "I can view the post button" do
    visit("/peeps/new")
    expect(page).to have_selector("input")
  end
end
