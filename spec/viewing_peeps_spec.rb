# User story 2,
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'Viewing peeps' do
  scenario 'I can see existing links on the links page' do
    Peep.create(peep: 'Makers Academy Rocks', user: 'George')

    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Makers Academy Rocks')
    end
  end
end
# User Story 3.
# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
feature 'Timestamp' do
  scenario 'See the time at which peep was made' do
    visit '/peeps/new'
    fill_in 'peep', with: 'Double McTwist 1260!'
    time = Time.now.to_s.delete(' ').insert(10,'T').insert(-3,':')
    click_button 'Create peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content(time)
    end
  end
end
