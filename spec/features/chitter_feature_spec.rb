feature "homepage" do

  scenario "display home page" do
    visit ('/')
    expect(page).to have_content "Chitter"
    expect(page).to have_content "Post a Peep:"
    expect(page).to have_button "POST"
  end
end

feature "peeps" do

  scenario "post a message/'peep'" do
    visit ('/')
    fill_in "message", with: "Hello world"
    click_on "POST"
    expect(current_path).to eq '/peeps'
  end
end
