describe Peep do
  let!(:user) do
    User.create(:first_name => 'George',
                :last_name => 'Lamprakis',
                :username => 'mormolis',
                :email => 'mormolis@example.com', 
                :password => '$2a$10$Wvsf3FLgypp/vxGAWjlSzukn3vDkyAC/bFqMIvzQAi50wrIWjoB4W')

  end
  let!(:peep1) do
    user.peeps << Peep.create(:peep_text => 'Here is a peep',
                              :date_time => Time.now)
    user.save
  end

  let!(:peep2) do
    user.peeps << Peep.create(:peep_text => 'Here is another peep',
                              :date_time => Time.now + 1)
    user.save
  end

  it "should create comparable objects by the date created" do
    expect(user.peeps[0].<=>(user.peeps[0])).to equal 0
    expect(user.peeps[0].<=>(user.peeps[1])).to equal 1
  end

  it "should sort all peeps in descending order" do
    expect(user.peeps.sort).not_to equal(user.peeps)
  end
end
