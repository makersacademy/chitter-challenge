require 'post'

describe Post do
    describe '#self.create' do
        it 'stores the post details on the chitter database' do
            Post.create(name: 'Raf Swiderski', username: 'rafswid', content: 'Hello Chitter')
            posts = Post.all
            expect(posts.length).to eq 1
            expect(posts.first).to be_a Post
            expect(posts.first.name).to eq 'Raf Swiderski'
            expect(posts.first.username).to eq 'rafswid'
            expect(posts.first.content).to eq 'Hello Chitter'
        end
    end
end