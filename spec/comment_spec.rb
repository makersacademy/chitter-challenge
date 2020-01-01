require_relative '../public/lib/comment.rb'

describe Comment do

  describe '#all' do

    it 'should only get the comments for the message they are relevant to' do
      Message.add('dbacall', 'Hello world')
      Message.add('dbacall', 'Second message')
      Comment.add('dbacall' ,'No way', Message.all[0].id)
      expect(Comment.all(Message.all[0].id)[0].message_id).to eq Message.all[0].id
    end

  end

end
