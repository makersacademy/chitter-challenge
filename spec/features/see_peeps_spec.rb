feature "see Peep" do
  scenario "I want to see my Peep on Chitter" do
    Peep.create(title: 'hello Chitter')
    visit "/peeps"
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content("hello Chitter")
    end

  end
end
