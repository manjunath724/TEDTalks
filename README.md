# TED Talks

## Technical Details
- Using
```
ruby '2.5.0'
gem 'rails', '~> 5.2.1'
gem 'sqlite3', '1.3.13'          # Used as a Database
gem 'jquery-rails', '4.3.3'      # Used for jQuery support
gem 'sunspot_rails', '2.2.7'     # Used as a search engine
gem 'sunspot_solr', '2.2.7'      # Used as a search engine
gem 'kaminari', '1.1.1'          # Used for pagination
```
- Using `rbenv` as the Ruby Version Management tool.

## Steps to setup and run the project on Ubuntu
- Unzip the TEDTalks.zip file
```
unzip TEDTalks.zip
```
- CD into the repository and run 
```
bundle install
``` 
and
```
rake db:create db:migrate db:seed
```
Note: Provided input file has issue with respect to special character like �� and additional comma's. Ergo, a sample with only one record has been used. Correcting the file and modifying the file path in db/seeds.rb file should work as expected.

- Start the solr and reindex the data
```
bundle exec rake sunspot:solr:start
bundle exec rake sunspot:reindex
```
- Start the server
```
rails server
```
- visit `localhost:3000` in your browser.
- You will be presented with tags to select to populate the talks list
- You can perform below operations on the populated list
  - Search for a talk
  - Filter by event
  - Sort results
  - Paginate through results

- Rspec test cases are not covered due to shortage of time

<hr>
