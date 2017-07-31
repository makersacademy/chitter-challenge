feature 'able to post a peep to chitter' do
  let(:peep) { 'Hello chitter!' }
  before { sign_up }
  scenario 'logged in' do
    log_in('Dave', '12345')
    new_peep(peep)
    expect(Peep.all.count).to eq 1
    expect(current_path).to eq '/peeps'
    expect(page).to have_content peep
  end
  scenario 'cannot post when not logged in' do
    visit '/peeps'
    expect(page).to have_no_button 'Compose Peep'
    visit '/peeps/new'
    expect(page).to have_content 'Please sign in to compose a peep'
  end
end
