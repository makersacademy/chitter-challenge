class Chitter 

  @peeps = ["this is the first message ever posted to chitter", "this is the second", "okay now i've posted three"]

  def self.all
    @peeps
  end

  def self.add(peep)
    @peeps = @peeps.push(peep)
    peep
  end

end