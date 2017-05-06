describe Peep do

  scenario 'create peep' do
    DatabaseCleaner.clean
    Peep.create(
    text: "text of peep",
    date_time: DateTime.now,
    user_id: 1
    )
    expect(Peep.all.count).to eq 1
  end

  it { expect(Peep.first.text).to eq "text of peep" }
  it { expect(Peep.first.user_id).to eq 1 }
  it { expect(Peep.first.date_time.to_s).to include DateTime.now.strftime("%Y-%m-%dT%H:%M") }

  scenario 'add a bunch of peeps' do
    bunch_of_peeps
    expect(Peep.all.count).to eq 11
  end
end
