require 'pony'

class MessageService 

  def self.send
    Pony.mail :to => 'mirceacosmin@gmail.com',
            :from => 'mirceacosmin@gmail.com',
            :subject => 'Howdy, Partna!'
  end

end