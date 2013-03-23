<h1>Connha</h1>

This project rocks and uses MIT-LICENSE.

Installation
Add to your Gemfile:

```ruby
gem 'connha'
```

Then run:

```sh
$ bundle update
```

Run install script:

```sh
$ rails g connha:install
```

And don't forget to migrate you database:

```sh
$ rake db:migrate
```

Preparing your models

In your model:

```ruby
class ModelName < ActiveRecord::Base
  acts_as_connectable
end
```
