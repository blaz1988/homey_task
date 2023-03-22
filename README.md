# Project Conversation History - Ruby on Rails Web App

This Ruby on Rails web application allows users to manage projects, leave comments, and track status changes.

## Running Tests

To run the test suite (RSpec) for the application, execute the following command in your terminal:

```
bundle exec rspec spec
```

## Setup

* install ruby '3.1.2'

```
sudo apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
rbenv install 3.1.2
rbenv global 3.1.2
```

### clone project repo
```
git clone git@github.com:blaz1988/homey_task.git
```

### install gems
```
bundle install
```
### create database from database.yml
```
bundle exec rake db:create
```

###run migrations to create database structure
```
bundle exec rake db:migrate
```

### install webpacker

```
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
bundle exec rails webpacker:install
```

### run server on http://localhost:3000/
```
bundle exec rails s
```

# Coding guide


## Naming Convention 

```
Database
table name => plural_of_model_name
column names => singular_snake_case
foreign_key => singularized_table_name_id

Routes
resources :controller_name_plural
resource :controller_name_singular

Model 
name => CamelCase, singular (database table name is plural of model name)
file name => lowercase_singular_model_name.rb

Model Relationships
has_one/belongs_to :singular_model_name
has_many :plural_model_name

Controller 
name => CamelCase, plural, append "Controller" at the end
file name => lowercase_plural_controller_name.rb

View 
folder name => name of associated controller, plural
file name => action_name.html.erb
*CamelCase - first letter of every word capitalized, no spaces
*snake_case - words separated with underscore 

Methods
*snake_case - words separated with underscore

Classes
*CamelCase - first letter of every word capitalized, no spaces

```
