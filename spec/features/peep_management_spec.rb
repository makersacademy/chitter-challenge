feature 'Viewing peeps' do

    scenario 'visiting the home page I see the peeps listed' do
      Peep.create(message: "First peep")
      Peep.create(message: "Next peep")
      visit '/'
      expect(page).to have_content "First peep"
      expect(page).to have_content "Next peep"
    end

end