require_relative '../../app/models/peep'

feature "Peep Management" do

  let(:dan) do
    User.create(name: "dan",
                email: "test@test.com",
                username: 'super_tester',
                password: 'test')
  end

  let(:sam) do
    User.create(name: "sam",
                email: "newb@testing.com",
                username: 'bad_tester',
                password: 'whatiscucumber')
  end

  scenario "requires a valid user to be saved" do
    expect(Peep.count).to eq 0
    peep = Peep.new(peep: "hello")
    peep.save
    expect(Peep.count).to eq 0
  end

  scenario "saves to db when given valid user" do
    expect(Peep.count).to eq 0
    peep = Peep.new(peep: "hello", user: dan)
    peep.save
    expect(Peep.count).to eq 1
  end

  scenario "when second peep, that and original keeps correct username and name" do
    peep = Peep.create(peep: "hello", user: dan)
    expect(peep.user.name).to eq "dan"
    expect(peep.user.username).to eq "super_tester"
        peep2 = Peep.create(peep: "hello", user: sam)
    expect(peep2.user.name).to eq "sam"
    expect(peep2.user.username).to eq "bad_tester"
    expect(peep.user.name).to eq "dan"
    expect(peep.user.username).to eq "super_tester"
  end
end