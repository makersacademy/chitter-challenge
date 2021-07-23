class PeepRepo < ROM::Repository[:users]
  commands :create, update: :by_pk, delete: :by_pk
end
