class UserPeep

  def self.add(user_id:, peep_id:, thread_id:)
    DatabaseConnection.query("INSERT INTO user_peeps (thread_id, peep_id, user_id) VALUES('#{thread_id}','#{peep_id}','#{user_id}') RETURNING *")[0]
  end

end
