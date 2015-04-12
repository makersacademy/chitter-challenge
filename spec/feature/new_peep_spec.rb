feature 'Creating a new peep' do
  scenario 'can submit a peep' do
    sign_up
    post_peep
  end

  scenario 'peep is stored in db after submission' do
    sign_up
    expect(Peep.count).to eq 0
    post_peep
    expect(Peep.count).to eq 1
  end

  scenario 'peep-user association is prsent after submission' do
    sign_up
    expect(User.first.peeps.count).to eq 0
    post_peep
    expect(User.first.peeps.count).to eq 1
  end
end
