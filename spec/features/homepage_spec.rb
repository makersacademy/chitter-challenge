feature "Homepage" do
  scenario "exists" do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario "can go to the peeps page" do
    visit '/'
    click_button "Enter"
    expect(current_path).to eq "/peeps"
  end
end
