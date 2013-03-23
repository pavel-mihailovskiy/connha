<h1>Connha</h1>

This project rocks and uses MIT-LICENSE.

<h2>Installation</h2>
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

<h2>Preparing your models</h2>

In your model:

```ruby
class ModelName < ActiveRecord::Base
  acts_as_connectable
end
```
