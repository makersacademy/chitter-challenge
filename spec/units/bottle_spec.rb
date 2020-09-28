require "bottle"
require "./spec/web_helpers"

describe Bottle do
  describe "#post" do
    it "adds a new message" do
<<<<<<< HEAD
      clear_table()
      Bottle.post(666, 'Dear friends, I thank you from my heart and I ask you to continue to pray for me.', '2013-05-17 11:17:41')
      Bottle.post(125, "From orbit: Launch was awesome!!", "2009-05-13 21:33:35")
=======
      clear_table('bottles')
      clear_table('users')
      User.create('pontifex', 'Pope Francis', 'pope266@vatican.com', 'godiswatching')
      User.create('mass', 'Mike Massimino', 'mikemass@nasa.com', 'rocketman')
      Bottle.post('pontifex', 'Dear friends, I thank you from my heart and I ask you to continue to pray for me.', '2013-05-17 11:17:41')
      Bottle.post('mass', "From orbit: Launch was awesome!!", "2009-05-13 21:33:35")
>>>>>>> assets
      expect(Bottle.all[0].body).to eq 'Dear friends, I thank you from my heart and I ask you to continue to pray for me.'
      expect(Bottle.all[1].body).to eq 'From orbit: Launch was awesome!!'
    end
  end
end

