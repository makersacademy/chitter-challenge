require_relative '../lib/repositories/reply_repository'
require_relative 'database_helper'

RSpec.describe ReplyRepository do
  before(:each) do
    reset_chitter_table
  end

  context '.create' do
    it 'creates a new reply in the database' do
      content = 'This is a reply.'
      user_id = 1
      peep_id = 1

      reply = ReplyRepository.create(content, user_id, peep_id)

      expect(reply).to be_a(Reply)
      expect(reply.id).not_to be_nil
      expect(reply.content).to eq(content)
      expect(reply.user_id).to eq(user_id)
      expect(reply.peep_id).to eq(peep_id)
    end
  end

  context '.find_by_id' do
    context 'when reply with the given id exists' do
      it 'returns the reply' do
        content = 'This is a reply.'
        user_id = 1
        peep_id = 1

        created_reply = ReplyRepository.create(content, user_id, peep_id)
        found_reply = ReplyRepository.find_by_id(created_reply.id)

        expect(found_reply).to be_a(Reply)
        expect(found_reply.id).to eq(created_reply.id)
        expect(found_reply.content).to eq(content)
        expect(found_reply.user_id).to eq(user_id)
        expect(found_reply.peep_id).to eq(peep_id)
      end
    end

    context 'when reply with the given id does not exist' do
      it 'returns nil' do
        reply = ReplyRepository.find_by_id(999)

        expect(reply).to be_nil
      end
    end
  end

  context '.update' do
    it 'updates the content of the reply' do
      content = 'Initial content.'
      updated_content = 'Updated content.'
      user_id = 1
      peep_id = 1

      reply = ReplyRepository.create(content, user_id, peep_id)
      ReplyRepository.update(reply.id, updated_content)

      updated_reply = ReplyRepository.find_by_id(reply.id)

      expect(updated_reply).to be_a(Reply)
      expect(updated_reply.id).to eq(reply.id)
      expect(updated_reply.content).to eq(updated_content)
      expect(updated_reply.user_id).to eq(user_id)
      expect(updated_reply.peep_id).to eq(peep_id)
    end
  end

  context '.delete' do
    it 'deletes the reply from the database' do
      content = 'This is a reply.'
      user_id = 1
      peep_id = 1

      reply = ReplyRepository.create(content, user_id, peep_id)
      ReplyRepository.delete(reply.id)

      deleted_reply = ReplyRepository.find_by_id(reply.id)

      expect(deleted_reply).to be_nil
    end
  end

  context '.find_by_peep' do
    it 'returns all replies associated with the specified peep' do
      peep_id = 2

      reply1 = ReplyRepository.create('Reply 1', 1, peep_id)
      reply2 = ReplyRepository.create('Reply 2', 2, peep_id)

      replies = ReplyRepository.find_by_peep(peep_id)
      expect(replies).to be_an(Array)
      expect(replies.length).to eq(3)

      expect(replies[1]).to be_a(Reply)
      expect(replies[1].id).to eq(reply1.id)
      expect(replies[1].content).to eq(reply1.content)
      expect(replies[1].user_id).to eq(reply1.user_id)
      expect(replies[1].peep_id).to eq(reply1.peep_id)

      expect(replies[2]).to be_a(Reply)
      expect(replies[2].id).to eq(reply2.id)
      expect(replies[2].content).to eq(reply2.content)
      expect(replies[2].user_id).to eq(reply2.user_id)
      expect(replies[2].peep_id).to eq(reply2.peep_id)
    end
  end
end
