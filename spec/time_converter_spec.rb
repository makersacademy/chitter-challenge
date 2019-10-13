describe TimeConverter do
  describe '.time_since' do
    context 'given a very recent time' do
      it 'returns a nice time since string' do
        time = Time.now - 5
        expect(TimeConverter.time_since(time)).to eq "Seconds ago"
      end
    end

    context 'given a time up to 2 minutes ago' do
      it 'returns a nice time since string' do
        time = Time.now - 80
        expect(TimeConverter.time_since(time)).to eq "About a minute ago"
      end
    end

    context 'given a time up to an hour ago' do
      it 'gives the difference in minutes' do
        time = Time.now - 3000
        expect(TimeConverter.time_since(time)).to eq "50 minutes ago"
      end
    end

    context 'given a time up to a day ago' do
      it 'gives the difference in hours' do
        time = Time.now - 82_800
        expect(TimeConverter.time_since(time)).to eq "23 hours ago"
      end
    end

    context 'given a time yesterday' do
      it 'returns a nice string' do
        time = Time.new - 102_800
        expect(TimeConverter.time_since(time)).to eq "Yesterday"
      end
    end

    context 'given an earlier time' do
      it 'returns the time in days, weeks, months and years' do
        time = Time.new - 345_600
        expect(TimeConverter.time_since(time)).to eq "4 days ago"
      end
    end
  end
end
