feature "editing peeps" do
  before do
    visit '/'
    sign_up_1
    create_peeps
  end

  scenario "user sees edit button for own peeps" do
    expect(page).to have_selector(:button, "Edit_#{@peep_one.id}")
  end

  scenario "user does not see edit button for others' peeps" do
    click_button "Sign Out"
    sign_up_2
    expect(page).not_to have_selector(:button, "Edit_#{@peep_one.id}")
  end

  context "user clicks edit button" do
    before { click_button "Edit_#{@peep_one.id}"}

    scenario "user sees prefilled form" do
      expect(page).to have_field("content", with: "content1")
    end

    scenario "submitting form changes content of peep on main page" do
      fill_in("content", with: "new_content")
      click_button "Submit"
      expect(page).not_to have_content "content1"
      expect(page).to have_content "new_content"
    end

  end

end
