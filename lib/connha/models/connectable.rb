module Connha
  module Models
    module Connectable
      def self.included(mod)
        mod.extend(ClassMethods)
      end

      module ClassMethods
        def acts_as_connectable
          has_many :sent_requests, class_name: 'Connection', foreign_key: 'sender_id'
          has_many :received_requests, class_name: 'Connection', foreign_key: 'receiver_id'
        end
      end

      def connection_for(user)
        sent_requests.where(receiver_id: user) || received_requests.where(sender_id: user)
      end

      def approved_connections
        sent_requests.select(&:approved?)
      end

      def friends
        sent_requests.approved.map(&:receiver)
      end

      def connections
        sent_requests + received_requests
      end

      def pending_requests
        received_requests.pending
      end
    end
  end
end
