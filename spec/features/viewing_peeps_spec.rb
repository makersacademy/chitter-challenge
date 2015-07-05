feature 'Viewing peeps' do
  scenario 'I can see existing peeps' do
    Peep.create(peep: "Let's have some burgerking")
    visit '/peeps'
    within 'ul#links' do
      expect(page).to have_content("Let's have some burgerking")
    end
  end
end
