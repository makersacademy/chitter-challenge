require 'diary'
describe ' # .add' do
  it 'adding diary in diary table' do
    diary = Diary.add(title: 'FIRST BEST DAY!', body: 'Dear Diary, i opened up my feelings firstly today, so exiceted!.')
    Diary.add(title: 'SECOND BEST DAY!', body: 'Dear Diary, i opened up my feelings secondly today, so exiceted!.')
    diaries = Diary.all
    expect(diaries.length).to eq 2
    expect(diaries.first.title).to eq 'FIRST BEST DAY!'
    expect(diaries.first.body).to eq 'Dear Diary, i opened up my feelings firstly today, so exiceted!.'
  end
end

