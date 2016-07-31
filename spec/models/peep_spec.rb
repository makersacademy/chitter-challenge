describe Peep do

  let(:leo) do
    User.create(username: 'Leo',
                email: 'leo@test.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')

  end

  let(:jonny) do
    User.create(username: 'Jonny',
                email: 'jonny@test.com',
                password: 'another_password',
                password_confirmation: 'another_password')

  end

  it 'Saves a peep with a valid user' do
    expect(Peep.count).to eq 0
    Peep.create(peep: "Where did the sun go?", user: jonny)
    expect(Peep.count).to eq 1
  end

end

# User Story 6
# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

# User Story 5
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

# Not sure how to test these?
