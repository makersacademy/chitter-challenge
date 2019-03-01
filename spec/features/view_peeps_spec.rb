feature 'viewing peeps feed' do
  scenario 'shows a list of peeps in reverse date order' do
    
    @peep3 = Peep.create(text: 'Peep #3')
    @peep2 = Peep.create(text: 'Peep #2')
    @peep1 = Peep.create(text: 'Peep #1')

    visit '/peeps'

    expect(page).to have_content "Peep #3 (#{@peep3.created_at})"
    expect(page).to have_content "Peep #2 (#{@peep2.created_at})"
    expect(page).to have_content "Peep #1 (#{@peep1.created_at})"
  end
end
