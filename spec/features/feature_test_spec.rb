# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Can view a message (peep) on Chitter' do
  scenario 'a user wants to view a message' do
    Peep.create(message: 'Hello world!')
    visit '/peeps'
    expect(page).to have_content 'Hello world!'
  end
end

feature 'Can create a new message (peep) on Chitter' do
  scenario 'creating a new peep' do
    visit '/peeps/new'
    fill_in 'message',   with: 'Hello world!'
    click_button 'Peep!'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content('Hello world!')
    end
  end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'Can view all peeps in reverse chronological order' do
  scenario 'User adds 2 peeps then wants to view them' do
      Peep.create(message: 'Hello world!')
      Peep.create(message: 'Just chillin with the bae')
      visit '/peeps'
      expect(page).to have_content 'Peep: Just chillin with the bae Peep: Hello world!'
    end
  end
