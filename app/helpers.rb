class Chitter < Sinatra::Base
#Session methods
  def create_session_data(user)
    %w(id name username email).each { |field|
      create_field(field, user.public_send(field)) }
  end

  def create_field(field, value)
    session[field.to_sym] = value if value
  end

  def create_error_messages(model)
    session[:errors] = model.errors.full_messages
  end

  def current_user
    session[:username]
  end

#User methods
  def create_user(params)
    user = User.create(name: params[:name], username: params[:username],
      email: params[:email], password: params[:password],
      password_confirmation: params[:password_confirmation])
    create_tag(user)
    create_error_messages(user)
    user
  end

  def authenticate_user(params)
    user = User.authenticate(params[:email], params[:password])
    return nil unless user
    create_session_data(user)
    user
  end

  def check_for_mentions(tag_name)
    user_id = Tag.first(tag_name: tag_name).user_id
    return nil unless user_id
    email_user(user_id)
  end

  def email_user(id)
    TagBossMan.call(User.first(id: id), Peep.last, User.first(id: session[:id]))
  end

#Peep methods
  def create_peep(content)
    Peep.create(content: content, user_id: session[:id])
    check_for_tags(content)
  end

  def load_peeps(username)
    peeps = Peep.all(user_id: User.first(username: username).id)
    session[:peeps] = peeps.all.reverse.map { |peep|
      peep_for_printing(peep) }
  end

  def peep_for_printing(peep)
    pretty_peep = peep.content
    parsed = peep.created_at.to_s.scan(/([^T]*)T(.{5})/)
    # ------ ^^ DataMapper DateTime format to [[YYY-MM-DD, HH:MM]] 
    [pretty_peep, parsed[0][0], parsed[0][1]]
    # ^^ Returns a peep array with [content, date, time]
  end

#Tag methods
  def create_tag(user)
    Tag.create(tag_name: "@#{user.username}", user_id: user.id)
  end

  def check_for_tags(content)
    tags = content.scan(/[$|\s](@[^\s]*)+/)
    return unless tags
    tags.each { |tag| Tag.first_or_create(tag_name: tag.join) unless check_for_mentions(tag) }
  end
end
