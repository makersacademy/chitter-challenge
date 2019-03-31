require 'timestamp'

describe Timestamp do
  describe '.db_datetime_parse' do
    it 'should return time object from db timestamp string' do
      timestamp = Timestamp.db_datetime_parse('2019-03-31 17:59:17.887993+01')
      expect(timestamp.year).to eq 2019
      expect(timestamp.month).to eq 3
      expect(timestamp.day).to eq 31
      expect(timestamp.hour).to eq 17
      expect(timestamp.minute).to eq 59
      expect(timestamp.second).to eq 17
    end
  end
  describe '.date_to_string' do
    it 'should return formatted time string from time object' do
      timestamp = Timestamp.db_datetime_parse('2019-03-31 17:59:17.887993+01')
      expect(Timestamp.date_to_string(timestamp)).to eq '31/03/2019 17:59:17'
    end
  end
end
