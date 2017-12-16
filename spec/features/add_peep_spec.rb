feature "add peep" do
  before :each do
    user_sign_up
    add_peep
  end

  scenario "user adds peep" do
    expect(current_path).to eq('/')
  end

  scenario "peep count increases by 1" do
    expect { add_peep }.to change { Peep.count }.by 1
  end

  scenario "peep is shown on the homepage" do
    within "ul#peeps" do
      expect(page).to have_content("If everybody minded their own business, the world would go around a great deal faster than it does.")
    end
  end

  scenario "user is shown alongside peep" do
    within "ul#peeps" do
      expect(page).to have_content("Ellie W | @winnie")
    end
  end

  scenario "date is shown alongside peep" do
    within "ul#peeps" do
      expect(page).to have_content("12/16/17")
    end
  end

end
