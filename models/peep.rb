class Peep < ActiveRecord::Base
  belongs_to :user

  def process_user_tags
    new_html_content = content
    potential_user_names = content.scan(/(&)([a-zA-Z0-9_]+)/).uniq
    potential_user_names.each do |match|
      ref_user = User.where('lower(username) = ?' ,match[1].downcase).first
      if ref_user
        if PeepUserTag.where(user_id: ref_user.id, peep_id: self.id).empty?
          PeepUserTag.new(user_id: ref_user.id, peep_id: self.id)
        end
        new_html_content = new_html_content.gsub(/(&)(#{match[1]})/,"<a href='/users/profile/#{ref_user.id}'><b>\\1</b>\\2</a>")
      end
    end

    self.html_content = new_html_content
    self.save!
  end
end
