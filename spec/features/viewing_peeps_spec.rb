feature 'viewing peeps' do
  scenario "I can see peeps on the main page" do
    Peep.create(content: "Wow I just saw a robot who looked a lot like a cop!")
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content "Wow I just saw a robot"
  end
end