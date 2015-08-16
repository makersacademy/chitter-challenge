feature 'Viewing peeps' do
  xscenario 'You don\'t need to be signed in' do

  end

  scenario 'I can see existing peeps' do
    user = create(:user)
    write_peep(user, 'Hi there!')
    write_peep(user, 'How is everyone?')
    visit '/peeps'
    expect(page).to have_content('Hi there!')
    expect(page).to have_content('How is everyone?')
  end

  scenario 'I can see peeps from different users' do
    user_one = create(:user)
    user_two = create(:user_two)
    write_peep(user_one, 'Hi-de-hi!')
    write_peep(user_two, 'Howdy!')
    visit '/peeps'
    expect(page).to have_content('Hi-de-hi!')
    expect(page).to have_content('Howdy!')
  end

  xscenario 'Peeps appear in reverse chronological order' do

  end
end