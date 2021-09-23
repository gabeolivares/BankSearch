Bank Search Ruby Script Project
---------------------------------
TESTED ON Mac OS X Sierra V 10.12

REQUIREMENTS:
-Make sure Ruby is installed: https://www.ruby-lang.org/en/documentation/installation/
-I used ruby version ruby 2.3.0

GEMS:
-Make sure gem Google Places is installed: 'gem install google_places' or https://rubygems.org/gems/google_places/versions/0.33.0
-Make sure Rspec is installed: 'gem install rspec' or https://rubygems.org/gems/rspec/versions/3.4.0

HOW TO EXECUTE:
In BankSearch directory type 'ruby search.rb'.
This will prompt you to enter your latitude, longitude, and type. If correct lat, long, and type were entered a successful response
hash with the following keys:
                - code set to 200
                - message set to an array of locations. Each location is hashed containing only the name and latitude/longitude of
                  the location.

HOW TO RUN RSPEC TEST
In BankSearch directory run rspec test by typing
rspec spec/BankSearch/bank_search_spec.rb

Requirements:
1) Write a script in ruby that utilizes Google's place Search API:
https://developers.google.com/places/web-service/search
To accept a latitude, longitude, and type (either bank or atm) to return an array of locations in the response.

-I Implemented the google places gem which uses the same API and makes it easier to implement as well as an easier flow of the project

2) Successful response should be a hash w/ the following keys:
                - code set to 200
                - message set to an array of locations. Each location should be a hash containing only the name and lat/lon of the location.

- With a correct lat/long and type the successful response hash is returned with code => 200 and message => the locations of atm/bank/ or all

3) Sort response array by distance

- The return hash displays the closest locations based of the entered lat and long

4) Script should return closest 5 locations

- The return hash :message => returns 5 closest locations

5) Add parameter validation to ensure the class is called w/ a latitude + longitude + type. If required parameter is not present, should return an error code 301 and the message should contain info on what parameter is missing.

-A params validator ensures the params are valid before the class is called and the object is created. If invalid a 301 code is returned in a hash along with an error message of the incorrect param and the object will not be created.

6) Add additional validation to ensure parameters match what you need for the google API

-Once inside the class an additional param validator is called (@valid) before the google places API is called. If params are correct the google api is called.

7) Add support for type = all, which will return 10 closest banks + atms

- if user inputs 'all' a successful return hash with 10 of the closest banks and atms is return

8) Use TDD concepts where possible

-TDD (rspec) is implemented into the project. To run the rspec test type: 'rspec spec/BankSearch/bank_search_spec.rb'
These test ensure that Test Lat: 30.4284750 and Test Lon: -97.7550500 will return correct responses base on the input and has failed test based on incorrect input.

9) Use object oriented design and command pattern where possible

 -OOD was used to design this project

API Key: AIzaSyCI33WirMl2FJlzwi5vey0C8T63qnFh4Jg
Test Lat: 30.4284750
Test Lon: -97.7550500
