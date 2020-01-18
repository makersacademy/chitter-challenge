require 'database_connection'

describe DatabaseConnection do

  let(:subject) { DatabaseConnection}
  
  describe "#setup" do
    it "takes a database and connects" do
      expect(subject.setup('chitter_test')).is_a?(PG)
    end
  end

end