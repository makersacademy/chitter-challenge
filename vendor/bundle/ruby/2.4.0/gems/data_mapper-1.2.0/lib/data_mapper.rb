%w[
  dm-core
  dm-aggregates
  dm-constraints
  dm-migrations
  dm-transactions
  dm-serializer
  dm-timestamps
  dm-validations
  dm-types
].each do |lib|
  require lib
end
