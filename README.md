# Setup

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

*  clone project repo
```
git clone git@github.com:blaz1988/SaaS.git
```

*  install gems
```
bundle install
```
* create database from database.yml
```
bundle exec rake db:create
```

* run migrations to create database structure
```
bundle exec rake db:migrate
```

* install webpacker

```
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
bundle exec rails webpacker:install
```

* run server on http://localhost:3000/
```
bundle exec rails s
```

* create AdminUser for http://localhost:3000/admin

```
bundle exec rails c
AdminUser.create(email: "your@email.com", password: "your_password")
```

# Create new tables, models and basic Admin data

```
rails generate model Tokens name:string coingecko_query:string messari_query:string polygonscan_contract:string
bundle exec rake db:migrate
rails generate active_admin:resource Token
```

# Coding guide

* Skinny Controllers - Keep the controllers skinny and always extract logic to other classes or models.

BAD PRACTICE

```
def create
  name = params[:name]
  last_name = params[:last_name]
  user = User.create(name: name, last_name: name)
  Book.create(user: user, name: params[:book][:name])
end
```

GOOD PRACTICE

```
def create
  CreateUser.call(params: params)
end
```

* Naming Convention 

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

# Development rules

* for every ticket create a new branch in following format

```
git checkout -b <trello_id>/<ticket name>
```

* when ticket is ready for review then create a PR(pull request), and publish the link of PR to saas channel on slack and post it as comment inside trello ticket. Move your trello ticket to "Code review" column.

* when you get approval for PR, move your PR to testing column and deploy it on heroku.

* make sure that PR contains descriptive title and description with trello ticket link.
* if there are visible changes, take a screenshoot of your local env and post it inside PR description.
