# Plan for chitter challenge
## Handling peeps [x] [x] [xx--] [xx--] [--]
  [x] Domain model
  [x] Set up the project
  [] Set up databases
    [x] migrations folder
    [x] "chitter" (id, name, handle, time, content [max length=140])
      [x] 01 migration file
    [x] "chitter_test" (id, name, handle, time, content [max length=140])
    [] database_helper
  [] implementing CRUD
    [] C [x] R (U) [] D
    /The functionality of U is not implemented on purpose/
    [x] Read
      [x] feature tests
      [x] insert few peeps
      [x] pass feature test
      [x] refactor
      [x] TDD to implement PG and retrieve peeps from database - unit test for chitter.rb
      [x] show username
      [x] show name
      [x] show time
    [] Create
      [x] feature test
      [x] pass the feature test
      [x] refactor dummy data insertion
      [x] button on the main page to add new peep
      [] save user if logged in
  [] README
    [] full instructions
    [] Screenshots
## Handling userbase
[x] Set up databases
  [x] "userbase" in chitter_app (id, name, handle, email, password)
  [x] "userbase" in chitter_app_test (id, name, handle, email, password)
  [x] 02 migration route
[] implementing CRUD
  [] C [] R [] U [] D
  [] Read
  [] Create
    [] feature test
    [] pass the feature test
    [] refactor dummy data insertion
[] Style
  [] HTML labels for everything
  [] CSS classes added to elements
  [] CSS style

[]Consider adding an admin class
