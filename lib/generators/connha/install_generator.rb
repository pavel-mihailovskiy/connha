require 'rails/generators'
require 'rails/generators/migration'

module Connha
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    end

    def self.next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        Time.new.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end

    def create_migration_file
      migration_template "create_connections.rb", "db/migrate/create_connections.rb"
      migration_template "create_relationship_types.rb", "db/migrate/create_relationship_types.rb"
    end
  end
end
