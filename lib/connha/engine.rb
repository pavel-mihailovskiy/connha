module Connha
  class Engine < Rails::Engine
    
    initializer "connha.models.connectable" do
      ActiveSupport.on_load(:active_record) do
        include Connha::Models::Connectable
      end
    end
  end
end
