# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Creating a peep' do
  scenario 'peep count increases by 1' do
    sign_in
    expect { create_new_peep }.to change { Peep.count }.by(1)
  end
  scenario 'do not allow to peep if not signed in' do
    visit('peeps/new')
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content('You have to sign in to peep')
  end
end

feature 'Displaying peeps' do
  before do
    sign_in
  end
  scenario 'peeps are displayed in reverse chronological order' do
    create_new_peep(content: 'first')
    Timecop.travel(1) do
      create_new_peep(content: 'second')
    end
    visit('peeps')
    expect('second').to appear_before('first')
  end
  scenario 'can see the time at which it was made' do
    time = (Time.now).strftime("%d %b %Y - %l:%M %p")
    create_new_peep
    expect(page).to have_content time
  end
end
