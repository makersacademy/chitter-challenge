require 'model_router'

describe Peep do
  let(:user_details) {
    { 'email' => 'bob@testing.com', 'user_name' => 'bob' }
  }
  let(:a_test_peep) { [
    { :message => 'Words for a peep',
      :created_at => '2018-05-12 18:17:23 +0100',
      :user_id => @test_user.id }
    ] }

  before do
    @test_user = User.create(
      :email => user_details['email'],
      :user_name => user_details['user_name']
    )
  end

  context '#all' do
    it 'Stores peeps' do
      add_test_peeps_directly(a_test_peep)
      expect(Peep.all[0].message).to eq a_test_peep[0][:message]
    end
  end

  context '#create' do
    it 'Can add peeps' do
      test_peep = Peep.create(
        :message => "Some test words",
        :created_at => '2018-05-12 18:17:23 +0100',
        :user_id => @test_user.id
      )
      expect(Peep.all).to include test_peep
    end
  end
end
