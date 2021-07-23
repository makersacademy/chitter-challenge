require 'database_helpers'

require 'comment'
require 'chirps'

describe Comment do
    describe '.create' do
        it 'Gets comments from database' do
        chirp = Chirps.create(chirp: "Commenting on chirps", title: "Commenting")
        Comment.create(text: 'This is a other comment', chirp_id: chirp.id)
        Comment.create(text: 'This is another other comment', chirp_id: chirp.id)

        comments = Comment.where(chirp_id: chirp.id)
        comment = comments.first
        persisted_data = persisted_data(table: 'comments', id: comment.id )

        expect(comments.length).to eq(2)
        # expect(comment.id).to eq persisted_data.first['id']
        expect(comment.text).to eq 'This is a other comment'
        expect(comment.chirp_id).to eq chirp.id
        end
    end
end