feature 'Viewing peeps' do
  scenario 'users can see peeps in reverse chronological order on Chitter' do
    post_peeps_names(["Charlottay", "Felipe", "Harry"])
    expect(names(page)).to eq ["Charlottay", "Felipe", "Harry"]
  end
  scenario 'users can see the time the peep was made' do
    peep = Peep.new(name: 'Charlottay',
                    username:     '@codey_mc_code_face',
                    message:      'OMG! Makers weekend challenges r so cool?!!',
                    created_at:    DateTime.new(2017, 6, 3, 18, 30, 25))
    peep.save
    visit '/peeps'
    expect(times(page)).to eq ["18:30:25"]
  end
end
