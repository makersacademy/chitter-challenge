require 'database_helper'
require 'comment'
require 'chitter'

describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      chirp = Chitt.create(chirp: 'peep')
      comment = Comment.create(text: 'This is a test comment', chirp_id: chirp.id)

      persisted_data = persisted_data(table: 'comments', id: comment.id)

      expect(comment).to be_a(Comment)
      expect(comment.id).to eq(persisted_data.first['id'])
      expect(comment.text).to eq('This is a test comment')
      expect(comment.chirp_id).to eq(chirp.id)

    end
  end

  describe '.where' do
    it 'gets the relevant comments from the databse' do
      chirp = Chitt.create(chirp: "peep")
      Comment.create(text: 'This is a test comment', chirp_id: chirp.id)
      Comment.create(text: 'This is a second test comment', chirp_id: chirp.id)
  
      comments = Comment.where(chirp_id: chirp.id)
      comment = comments.first
      persisted_data = persisted_data(table: 'comments', id: comment.id)
  
      expect(comments.length).to eq(2)
      expect(comment.id).to eq(persisted_data.first['id'])
      expect(comment.text).to eq('This is a test comment')
      expect(comment.chirp_id).to eq(chirp.id)
    end
  end
end