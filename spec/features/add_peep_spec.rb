feature "add peep" do
  before :each do
    user_sign_up
  end

  scenario "peep count increases by 1" do
    expect { add_peep }.to change { Peep.count }.by 1
  end

  scenario "user's peep is shown on the homepage" do
    add_peep
    expect(current_path).to eq('/')
    within "ul#peeps" do
      expect(page).to have_content("If everybody minded their own business, the world would go around a great deal faster than it does.")
      expect(page).to have_content("Ellie W | @winnie")
      expect(page).to have_content(Time.new.strftime("%d/%m/%y at %H:%M"))
    end
  end

  scenario "user must be signed in to post peep" do
    expect(page).to have_content "Create a peep"
    click_on "Sign out"
    expect(page).not_to have_content "Create a peep"
  end
end
