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

### Javascript and Bootstrap
