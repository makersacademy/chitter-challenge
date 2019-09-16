class Peep
  attr_reader :peep_id, :user_id, :user, :submission_time, :content

  def self.create(user_id, user, submission_time, content)
    r = DBcon.query("INSERT INTO peep (content, submission_time, user_id)
    VALUES ('#{content}', '#{submission_time}', #{user_id}) RETURNING peep_id, content, submission_time, user_id;")
    Peep.new(r[0]['peep_id'], r[0]['user_id'].to_i, user, r[0]['submission_time'], r[0]['content'])
  end

  def self.all
    rs = DBcon.query('SELECT * FROM peep, users where peep.user_id = users.id ORDER BY submission_time DESC;')
    rs.map { |b| Peep.new(b['peep_id'].to_i, b['user_id'].to_i, b['name'], b['submission_time'], b['content']) }
  end

  def self.user_id_selected(id)
    @user_id_selected = id if id != nil
    @user_id_selected
  end

  def self.user_name_selected(name)
    @user_name_selected = name if name != nil
    @user_name_selected
  end

  def initialize(peep_id, user_id, user, submission_time, content)
    @peep_id = peep_id
    @user_id = user_id
    @user = user
    @submission_time = submission_time
    @content = content
  end
end
