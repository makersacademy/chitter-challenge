require 'tag'
require 'database_connection'

describe Tag do
  
  #mock tag

  describe '.create' do 
    
    it 'adds an entry to the tag table' do
      user = User.create(name: 'My_name', username: 'My_username', email:'myname@gmail.com', password:'some_password')
      result = Tag.find_id(tag_id: user.id)
      expect(result.content).to eq user.username
    end

    it 'checks whether a tag id exists' do
      user = User.create(name: 'My_name', username: 'My_username', email:'myname@gmail.com', password:'some_password')
      result = Tag.find_id(tag_id: user.id)
      expect(result.content).to eq user.username
    end

    it 'checks whether content exists' do
      user = User.create(name: 'My_name', username: 'My_username', email:'myname@gmail.com', password:'some_password')
      result = Tag.find_content(content: '@My_username')
      expect(result.content).to eq user.username
    end
  end

end