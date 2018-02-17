feature "adding peeps to the database" do
  scenario "user adds peep to the database" do
    visit('/')
    fill_in "text", with: "Good day for coding"
    fill_in "author", with: "Kota"
    click_button("Add Peep")
    expect(page).to have_content "Kota wrote: Good day for coding"
  end
end

feature "adding peeps to the database" do
  scenario "user enters too long peep" do
    visit('/')
    fill_in "text", with: "W systematyce (należącego do nauki o literaturze) piśmiennictwa tekst literacki to dzieło literackie stanowiące przedmiot badania w odróżnieniu od utrwalonych wyników badań, tj. opracowań teoretycznych, historycznych i krytycznych (podręczników, monografii, rozpraw, recenzji itp.)"
    fill_in "author", with: "Kota"
    click_button("Add Peep")
    expect(page).to have_content "Your peep is too long. The max limit is 240 characters."
  end
end

feature "adding peeps to the database" do
  scenario "user didn't add name" do
    visit('/')
    fill_in "text", with: "Good day for coding"
    click_button("Add Peep")
    expect(page).to have_content "Please enter your name."
  end
end
