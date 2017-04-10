require './app/models/peep'

describe Peep do
  let! (:user) {User.create(first_name: "Darth",
                           last_name: "Vader",
                           email: 'darth_vader@gmail.com',
                           username: "Darth_Vader",
                           password: "notanakin",
                           password_confirmation: "notanakin")}

  describe '.chronological' do
    it 'returns the peeps in chronological order' do
      old_peep = Peep.create(experience: "Coast to coast", user: user)
      new_peep = Peep.create(experience: "Surfing with a view", user: user)
      expect(Peep.chronological).to eq [new_peep, old_peep]
    end
  end
end
