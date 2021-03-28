class Tag

  def self.new_tag(user_id, peep_id)
    new_tag = DbConnection.query("INSERT INTO tags(user_id, peep_id) VALUES ('#{user_id}',
                                  '#{peep_id}') RETURNING tag_id, user_id, peep_id;")
    Tag.new(tag_id: new_tag[0]['tag_id'], user_id: new_tag[0]['user_id'],
                                   peep_id: new_tag[0]['peep_id'])
  end

  attr_reader :tag_id, :user_id, :peep_id

  def initialize(tag_id:, user_id:, peep_id:)
    @tag_id = tag_id
    @user_id = user_id
    @peep_id = peep_id
  end
end
