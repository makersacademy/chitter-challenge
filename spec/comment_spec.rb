require 'comment'
describe Comment do

  describe 'Commenting' do
    describe '.add' do
      it 'adds a comment to the peep' do
        user_peeping = double(:user_peeping, id: 0, name: 'Patrick')
        @peep = Peep.add({:content => 'blach'}, user_peeping)
        user = double(:user, id: 1)
        comment = Comment.add(@peep.id, {:content => 'argh'}, user)
        expect(@peep.comments.first.content).to eq 'argh'
      end
    end
  end
end
