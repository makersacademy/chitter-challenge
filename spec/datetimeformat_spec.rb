require 'dateformat'

describe DateTimeFormat do

  it 'returns just now if post was within two minutes of current time' do
    pending
    allow(Time).to receive(:now).and_return('2018-10-28 12:53:58 +0000')
    post_1_time = '2018-10-28 12:52:58 +0000'
    expect(subject.datetime_format(post_1_time)).to eq 'just now'
  end

  it 'returns today and time if post was longer than two minutes ago but today' do
    pending
    allow(Time).to receive(:now).and_return('2018-10-28 12:53:58 +0000')
    post_2_time = Time.now - 140
    post_3_time = Time.now - 60 * 60 * 10
    expect(subject.datetime_format(post_2_time)).to eq 'today at 01:52'
    expect(subject.datetime_format(post_3_time)).to eq 'today at 12:02'
  end




end
