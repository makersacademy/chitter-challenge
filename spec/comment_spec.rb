require 'comment'

describe Comment do
  let(:user) { double(User.add(username: 'user1', password: 'password123', email: 'user1@gmail.com', name: 'user name'), id: User.list.first.id) }
  let(:peep) { double(Peeps.add(peep: 'New peep', user_id: user.id), id: Peeps.list.first.id) }

  it 'should be able to list all the comments made' do
    comment = Comment.add(text: 'New comment', peep_id: peep.id, user_id: user.id)
    expect(comment.text).to eq 'New comment'
  end

  it 'should be able to add a new comment' do
    expect { Comment.add(text: 'New comment', peep_id: peep.id, user_id: user.id) }.to change { Comment.list.count }.by 1
  end
end
