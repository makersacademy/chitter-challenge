feature "Viewing peeps" do

  scenario "I can view all the peeps" do
    Peep.create(message: "Morning London!")
    visit('/peeps')
    expect(page.status_code).to eq 200
    
    within 'ul#peeps' do
      expect(page).to have_content "Morning London!"
    end
  end
end
