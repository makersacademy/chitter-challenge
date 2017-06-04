feature "user can add links" do
  before do
    sign_up
  end

  scenario "Can create peep" do
    click_button 'Send a Peep'
    fill_in :peep, with: "Hello Chitter"
    click_button "Send Peep"
  end

  scenario "save peeps to database" do
    create_peep
    expect(current_path).to eq '/home'
    expect(page).to have_content("Hello Chitter")
  end
end
