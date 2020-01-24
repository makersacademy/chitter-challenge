def add_2x_messages_with_tags
  message_id_1 = DatabaseConnection.command("INSERT INTO messages (text, user_id_fkey) VALUES ('test message including #im_a_tag tag', '#{user.current_user}') RETURNING message_id;")[0]['message_id']
  message_id_2 = DatabaseConnection.command("INSERT INTO messages (text, user_id_fkey) VALUES ('test message including #im_a_tag tag', '#{user.current_user}') RETURNING message_id;")[0]['message_id']
  tag_id = DatabaseConnection.command("INSERT INTO tags (tag) VALUES ('im_a_tag') RETURNING tag_id;")[0]['tag_id']
  DatabaseConnection.command("INSERT INTO tags_messages (tag_id_fkey, message_id_fkey) VALUES ('#{tag_id}', '#{message_id_1}');")
  DatabaseConnection.command("INSERT INTO tags_messages (tag_id_fkey, message_id_fkey) VALUES ('#{tag_id}', '#{message_id_2}');")
  return [message_id_1, message_id_2, tag_id]
end
