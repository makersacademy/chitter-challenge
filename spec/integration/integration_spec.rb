require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  before do
    create_test_peep('2022-10-09 22:31:54.554154 UTC', 'first test peep - bottom', 1)
    create_test_peep('2022-10-09 22:31:55.554154 UTC', 'second test peep - up 1', 1)
    create_test_peep('2022-10-09 22:31:56.554154 UTC', 'bobs 1st test peep', 2)
    create_test_peep('2022-10-09 22:31:57.554154 UTC', 'bobs 2nd test peep', 2)
    create_test_peep('2022-10-09 22:31:58.554154 UTC', 'back once again with the renegade master', 1)
    create_test_peep('2022-10-09 22:31:59.554154 UTC', 'a new challenger appears', 3)
  end

  context 'GET /feed' do
    it 'shows the peep feed' do
      response = get('/feed')

      expect(response.body).to include('first test peep - bottom')
      expect(response.body).to include('2022-10-09 22:31:54.554154 UTC')
      expect(response.body).to include('back once again with the renegade master')
    end
  end

  def create_test_peep(timestamp, content, maker_id)
    PeepManager.instance.create(
      Peep.new(timestamp, content, maker_id)
    )
  end
end
