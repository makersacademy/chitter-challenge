module PeepHelpers
  def current_peeps
    @users = create_users
    peeps = [[@users.first.id, 'I am coding and testing Chitter challenge'],
             [@users.first.id, 'I am going out for a walk'],
             [@users.last.id, 'I am reading POODR'],
             [@users.last.id, 'I am meditating']]
    peeps.each do |user_id, text|
      Peep.create(user_id: user_id, text: text, timestamp: Time.now)
    end
    Peep.all
  end

  def page_content(peeps)
    page_content = peeps.map do |peep|
      "#{peep.user.name} #{peep.user.username}: #{peep.text}
      \n #{peep.timestamp}"
    end
    page_content.reverse.join(' ')
  end

  def peek_at_peeps
    visit('/peeps')
  end

end
