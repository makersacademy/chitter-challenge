configure :development do
  DataMapper.setup(:default, 'postgres://student/chitter')
end
