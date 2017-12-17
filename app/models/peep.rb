require 'dm-validations'


class Peep

  include DataMapper::Resource
  property :id, Serial
  property :peep, String
  property :time, String, default: lambda {|r,p| Time.now.strftime('%b %e, %l:%M:%S %p')}

  belongs_to :user, required: false
  has n, :tags, through: Resource

  def tags=(tagstring)
  	tagstring.split(", ").each{|text|
  	 self.tags << Tag.create(text: text) 
  	}
  	self.save
  end

  def time_class=(time_class)
    self.time = time_class.now.strftime('%b %e, %l:%M:%S %p')
  end

end
