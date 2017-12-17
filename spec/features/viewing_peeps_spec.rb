feature "Viewing peeps" do

  scenario "I can view all the peeps" do
    peep = Peep.create(message: "Morning London!")
    visit('/peeps')
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content "Morning London!"
      expect(page).to have_content "Posted at: #{peep.created_at}"
    end
  end
end
