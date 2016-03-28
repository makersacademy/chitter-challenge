feature 'new peep' do
  scenario 'creates a new peep' do
    sign_up
    expect{new_peep}.to change{Peep.count}.by(1)
  end
end