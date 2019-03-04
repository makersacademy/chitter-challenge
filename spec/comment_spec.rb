require 'database_helpers'
require 'comment'
require 'peep'
require 'user'
require 'spec_helper'


describe 'Comment' do
  describe '.create' do
    it 'creates a new comment' do
      user = User.create(name: 'Simona', email: 'simona.gioe88@gmail.com', username: 'Airies', password: 'Password123')
      user2 = User.create(name: 'Marco', email: 'marco@gmail.com', username: 'nerd', password: 'pass123')
      peep = Peep.create(text: "First peep text test", posted_time: (Time.now).strftime("%d/%m/%Y %H:%M"), user_id: user.id)
      comment = Comment.create(text: 'This is a test comment', peep_id: peep.id, user_id: user2.id)

      persisted_data = persisted_data(table: 'comments', id: comment.id)

      expect(comment).to be_a Comment
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq 'This is a test comment'
      expect(comment.peep_id).to eq peep.id
      expect(comment.user_id).to eq user2.id
    end
  end

  describe '.where' do
    it 'gets the relevant comments from the database' do
      user = User.create(name: 'Simona', email: 'simona.gioe88@gmail.com', username: 'Airies', password: 'Password123')
      user2 = User.create(name: 'Marco', email: 'marco@gmail.com', username: 'nerd', password: 'pass123')

      peep = Peep.create(text: "First peep text test", posted_time: (Time.now).strftime("%d/%m/%Y %H:%M"), user_id: user.id)
      Comment.create(text: 'This is a test comment', peep_id: peep.id, user_id: user.id)
      Comment.create(text: 'This is a second test comment', peep_id: peep.id, user_id: user2.id)

      comments = Comment.where(peep_id: peep.id)
      comment = comments.first
      persisted_data = persisted_data(table: 'comments', id: comment.id)

      expect(comments.length).to eq 2
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq 'This is a test comment'
      expect(comment.peep_id).to eq peep.id
      expect(comment.user_id).to eq user.id
    end
  end
end
