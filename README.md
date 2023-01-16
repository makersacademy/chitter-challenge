Chitter Challenge
=================
To setup this repository, run in your terminal:
```bash
rake db:create
rake db:migrate
rake db:seed
rake db:migrate RACK_ENV="test"
rake db:seed RACK_ENV="test"
rackup
```
You should then be able to view the website at http://localhost:9292/ in your browser.
