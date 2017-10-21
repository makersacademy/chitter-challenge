# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'viewing peeps' do
  scenario 'I can see peeps in reverse chronological order' do
    Peep.create(peep: 'My first peep: Global Warming is a hoax!', time: Time.now)
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
    expect(page).to have_content "My first peep: Global Warming is a hoax!"
    end
  end


  scenario 'I can see the time at which peeps were written' do
    Peep.create(peep: 'My first peep: Global Warming is a hoax!', time: Time.now)
    visit '/peeps'
    expect(page).to have_content "My first peep: Global Warming is a hoax!", Time.now.strftime("%H:%M : %d/%m/%Y")
  end
end
