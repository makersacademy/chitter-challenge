# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made


feature 'Viewing peeps' do
    scenario 'User can view a peep on chitter' do
      Peep.create(body: 'My first peep')
      visit '/peeps'
      expect(page).to have_content("My first peep")
    end

  scenario "User can see the time a peep was posted" do
    Timecop.freeze do
      Peep.create(body: 'Frozen in time!')
      visit '/peeps'
      expect(page).to have_content(DateTime.now.strftime("%H:%M on %d %b %Y"))
    end
  end

  scenario 'Peeps are in reverse chrono order' do
    Peep.create(body: 'My first peep')
    Peep.create(body: 'My second peep')
    visit '/peeps'
    expect('My second peep').to appear_before('My first peep')
  end
end
