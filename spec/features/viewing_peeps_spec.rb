feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the chitter feed page' do

    sign_up_sign_in_and_peep(peep: "This is my first peep!")

    within 'ul#peep' do
      expect(page).to have_content("This is my first peep")
    end
  end
end
