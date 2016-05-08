feature "create a new peep" do
  scenario "add a new peep to my peeps" do
    sign_up
    expect { create_peep }.to change(Peep, :count).by(1)
    expect(page).to have_content "My first peep"
    expect(page).to have_content "Amy"
    expect(Peep.first.message).to eq("My first peep")
  end

  scenario "see what time the peep was created" do
    sign_up
    create_peep
    expect(page).to have_content "#{Time.now.strftime("%Y-%m-%d %H:%M")}"
  end

  scenario "cannot write a peep if not logged in" do
    sign_up
    logout
    visit "/peeps/new"
    expect(page).to have_content "Please login to peep"
  end

  scenario "cannot create peep if no message" do
    sign_up
    expect { create_peep(nil) }.to change(Peep, :count).by(0)
  end
end
