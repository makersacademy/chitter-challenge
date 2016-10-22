feature "see Peep" do
  scenario "I want to see my Peep on Chitter" do
    Link.create(title: 'hello Chitter')
    visit "/links"
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content("hello Chitter")
    end

  end
end
