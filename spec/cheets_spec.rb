require './lib/cheets'

describe Cheets do

  it { should have_property   :id         }
  it { should have_property   :body       }
  it { should have_property   :created_at }

  describe 'User cheets' do
    it "Allows the user to post a cheet" do
      cheet = Cheets.create(body: 'User cheet', created_at: Time.now)

      expect(cheet).to be_a Cheets
      expect(cheet).to respond_to(:id)
      expect(cheet.body).to eq 'User cheet'
    end
  end
end
