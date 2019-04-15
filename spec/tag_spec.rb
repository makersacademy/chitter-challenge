require 'tags'
require 'database_helpers'

describe Tags do
  let(:peep_class) { double(:peep_class) }

  describe '.create' do
    context 'tag does not exist' do
      it 'creates a new Tag object' do
        user = User.create(email: 'test@example.com', password: 'password123', name: 'Test', username: 'Tester')
        peep = Peeps.create(message: 'Test', user_id: user.id)
        tag = Tags.create(tag: user.username, id: peep.id)

        persisted_data = persisted_data(id: tag.id, table: 'tags')

        expect(tag).to be_a Tags
        expect(tag.id).to eq persisted_data.first['id']
        expect(tag.user_id).to eq user.id
        expect(tag.peep_id).to eq peep.id
      end
    end
    context 'tag already exists' do
      it "doesn't allow same peep to be tagged with same name" do
        user = User.create(email: 'test@example.com', password: 'password123', name: 'Test', username: 'Tester')
        peep = Peeps.create(message: 'Test', user_id: user.id)
        Tags.create(tag: user.username, id: peep.id)
        tag2 = Tags.create(tag: user.username, id: peep.id)

        expect(tag2).to eq 'Already Tagged'
      end
    end

    context 'username does not exist' do
      it 'does not let you create a tag for a username that does not exist' do
        user = User.create(email: 'test@example.com', password: 'password123', name: 'Test', username: 'Tester')
        peep = Peeps.create(message: 'Test', user_id: user.id)
        Tags.create(tag: user.username, id: peep.id)
        tag2 = Tags.create(tag: 'test', id: peep.id)

        expect(tag2).to eq 'Username Not Found'
      end
    end
  end

  describe '.find' do
    it 'returns a tag with the given id' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Test', username: 'Tester')
      peep = Peeps.create(message: 'Test', user_id: user.id)
      tag = Tags.create(tag: user.username, id: peep.id)

      result = Tags.find(peep_id: peep.id)

      expect(result.id).to eq tag.id
    end
  end
end
