feature "Views peeps" do

  scenario "Can see all peeps on the home page" do
    Peep.create(message: "peeping tom peeped you", username: "bobross", time: "12.34")
    visit '/'
    expect(page).to have_content "bobross peeped:- peeping tom peeped you at 12.34"
  end

end
