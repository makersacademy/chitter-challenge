require 'dm-validations'


class Peep

  include DataMapper::Resource
  property :id, Serial
  property :peep, String
  property :time, String, default: lambda {|r,p| Time.now.strftime('%b %e, %l:%M %p')}
  def time_class=(time_class)
    self.time = time_class.now.strftime('%b %e, %l:%M %p')
  end

end
