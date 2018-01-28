Chitter
=================

* How to use Chitter and peep from your computer:

1. Open command line on your Mac
2. Go to a folder where you want to clone the Chitter
3. Type ```git clone git@github.com:AlexandraGF/chitter-challenge.git```
4. Run ```bundle install``` in order to install the gems
4. Change directory to be in the root of Chitter ```cd chitter-challenge```
5. From command line type ```ruby './app/app.rb' ``` or ```rackup```
This will start the server, so you can run the app in your browser.
6. On any browser type ``` localhost:4567/ if you've run with ruby``` or ```localhost:9292/ if run with rackup``` to run the app
7. On the homepage, please fill in the fields and then click Submit button
8. From your browser, type ``` localhost:4567/peeps/new_peep ``` or ```localhost:9292/peeps/new_peep ``` to write a new peep and click the button Send
9. Every time you want to write a new peep, you can write under the same maker name and just type ``` localhost:4567/peeps/new_peep ``` or ```localhost:9292/peeps/new_peep ``` to write a new peep and click the button Send or you can change your name by typing ```localhost:4567/ ``` or ```localhost:9292/``` in your browser and then follow the same steps from 7 - 8 and the new peep will be under the new maker name.

* How to use Chitter and peep on Heroku website:

1. Type ```https://chitterpeep.herokuapp.com``` in your browser and click enter
2. On the homepage, please fill in the fields and then click Submit button
3. From your browser, type ```https://chitterpeep.herokuapp.com/peeps/new_peep ``` to write a new peep and click the button Send
4. Every time you want to write a new peep, you can write under the same maker name and just type ``` https://chitterpeep.herokuapp.com/peeps/new_peep ``` to write a new peep and click the button Send or you can change your name by typing ```https://chitterpeep.herokuapp.com``` in your browser and then follow the same steps from 2 - 3 and the new peep will be under the new maker name.


```
Side note: Chitter is still in development and I would like to thank you
for using it and also for your patience!
```

Technologies used:

```
I had created a single controller to manage all the logic in app.rb

I had created the app in Ruby and also adopted the Sinatra framework.

For testing, I've used Rspec and Capybara. As for storing the makers
and peeps, this was achieved by using DataMapper and PostGresQL.
I had also used the 'Bcrypt' gem to encrypt passwords.

```

Some screenshots from the web app:
* Homepage
![alt tag](https://github.com/AlexandraGF/chitter-challenge/blob/master/public/screenshots/homepage.png)

* Create a new peep
![alt tag](https://github.com/AlexandraGF/chitter-challenge/blob/master/public/screenshots/peep.png)

* Show peeps
![alt tag](https://github.com/AlexandraGF/chitter-challenge/blob/master/public/screenshots/peeps.png)

``` Happy peeping! ```
