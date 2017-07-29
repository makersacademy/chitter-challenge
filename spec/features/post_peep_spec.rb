feature 'able to post a peep to chitter' do
  let(:peep) { 'Hello chitter!' }
  scenario 'new message' do
    new_peep(peep)
    expect(Peep.all.count).to eq 1
    expect(current_path).to eq '/peeps'
    expect(page).to have_content peep
  end
end
