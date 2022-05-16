# README

### User model
`bin/rails generate model User email:string lastname:string forename:string`

### Passwordless
added passwordless gem to Gemfile

`bin/rails passwordless:install:migrations`

Updated User model:
```ruby
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  passwordless_with :email
end
```

Mount the engine in your routes:
```ruby
Rails.application.routes.draw do
  passwordless_for :users
end
```

```ruby
class ApplicationController < ActionController::Base
  include Passwordless::ControllerHelpers # <-- This!
  
  helper_method :current_user

  private

  def current_user
    @current_user ||= authenticate_by_session(User)
  end

  def require_user!
    return if current_user
    redirect_to root_path, flash: { error: 'You are not worthy!' }
  end
end
```

Add to `./config/application.rb`:
```ruby
config.action_mailer.default_url_options = { host: 'example.com' }
```

Added `passwordless.rb`


### Javascript and Bootstrap
Notes from: https://blog.eq8.eu/til/how-to-use-bootstrap-5-in-rails-7.html
```bash
bin/importmap pin bootstrap
bin/importmap pin datatables
```

In Gemfile:
```ruby
gem 'bootstrap', '~> 5.1.3'
```

### Friendly ID
Add to gem file

generate models with slug:
`rails g scaffold discipline name:string slug:uniq`

### Many-to-many joins
`rails g migration CreateJoinTableRolesUsers roles users`
