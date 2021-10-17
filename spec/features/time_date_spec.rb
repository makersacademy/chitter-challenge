feature "peeps now show the date created" do
  scenario "added tweet shows today's date" do
    Peep.create(content: "Hello, it's the s16th today")
    date_today = Date.today.to_s
    visit "/"
    expect(page).to have_content(date_today)
  end
end
