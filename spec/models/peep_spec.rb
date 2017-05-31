describe Peep do
  it 'Associates peep objects with users' do
    user = User.create(name: "Will", email: "w_gant@yahoo.co.uk")
    expect{user.peeps.create(peep: "test peep", time: Time.new.strftime("%H:%M"), date: Time.new.strftime("%Y-%m-%d"))}.to change{Peep.count}.by(+1)
  end
end
