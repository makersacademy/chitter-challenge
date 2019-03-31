require './lib/tag_verification_service'

describe TagService do

  describe '.check tag' do

    it 'if a tag is provided in the peep, service will check the tags database' do
      user = User.create(name: 'My_name', username: 'My_username', email:'myname@gmail.com', password:'some_password')
      expect(TagService.check(peep: 'Hello @My_username')).to eq "We have a match"
    end

  end

end