require_relative '../lib/user_model'

RSpec.describe User do
  xdescribe '.create' do
    it 'stores users details in database' do
      described_class.create('Sarpong','Abasimi','a@demo.com','pass')
      expect(described_class.all).('hello')
    end
  end
end