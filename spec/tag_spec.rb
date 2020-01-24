require 'tag'

describe Tag do

  before(:each) do
    user_id = DatabaseConnection.command("SELECT user_id FROM users;")[0]['user_id']
    @message_id = DatabaseConnection.command("INSERT INTO messages (text, user_id_fkey) VALUES ('test message including #im_a_tag tag', '#{user_id}') RETURNING message_id;")[0]['message_id']
    Tag.setup(dbconnection: DatabaseConnection)
  end

  describe '.setup' do
    it 'responds to setup' do
      expect(Tag).to respond_to(:setup)
    end
  end

  describe '.new_message' do
    it 'responds to add_tag' do
      expect(Tag).to respond_to(:new_message)
    end
    it 'extracts tag and adds it to the database' do
      Tag.new_message('test message including #im_a_tag tag', @message_id)
      tag = DatabaseConnection.command("SELECT * FROM tags")[0]['tag']
      expect(tag).to eq('im_a_tag')
    end
    it 'doesnt add tags which are already in the database' do
      Tag.new_message('test message including #im_a_tag tag', @message_id)
      Tag.new_message('test message including #im_a_tag tag', @message_id)
      tags = DatabaseConnection.command("SELECT * FROM tags")
      expect(tags.to_a.length).to eq(1)
    end
    it 'adds tag to tag_comment join table' do
      Tag.new_message('test message including #im_a_tag tag', @message_id)
      tag_message = DatabaseConnection.command("SELECT * FROM tags_messages;")[0]
      tag_id = DatabaseConnection.command("SELECT tag_id FROM tags WHERE tag='im_a_tag'")[0]['tag_id']
      expect(tag_message['message_id_fkey']).to eq(@message_id)
      expect(tag_message['tag_id_fkey']).to eq(tag_id)
    end
  end

  describe '.top_tags' do
    it 'responds to top_tags' do
      expect(Tag).to respond_to(:top_tags)
    end
    it 'returns top ten tags' do
      11.times{|i|
        tag_id = DatabaseConnection.command("INSERT INTO tags (tag) VALUES ('im_a_tag#{i}') RETURNING tag_id;")[0]['tag_id']
        DatabaseConnection.command("INSERT INTO tags_messages (tag_id_fkey, message_id_fkey) VALUES ('#{tag_id}', '#{@message_id}')")}
      toptags = Tag.top_tags
      expect(toptags.length).to eq(10)
    end
    it 'returns top tags as tag object' do
      DatabaseConnection.command("INSERT INTO tags (tag) VALUES ('testtag')")
      toptags = Tag.top_tags
      expect(toptags).to all(be_a(Tag))
    end
  end
end
