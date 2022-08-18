feature "create a peep" do
  scenario "peep is added" do
    allow(Time).to receive(:now).and_return(Time.new(2022,06,12,9,45,0))
    visit "/"
    click_button "Sign up"
    user_sign_up
    fill_in "content", with: dummy_text
    click_button "Peep!"
    expect(page).to have_content(dummy_text)
    expect(page).to have_content("Sunday 12 June 2022, 09:45 AM")
    expect(page).to have_content("@sophieg")
  end
end