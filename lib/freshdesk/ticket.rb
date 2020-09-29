module Freshdesk
  class Ticket < FreshdeskObject
    class << self
      def create(params: {})
        new("/tickets").resource(params: params).post
      end

      def create_an_outbound_email(params: {})
        new("/tickets/outbound_email").resource(params: params).post
      end

      def retrieve(id:, query: "")
        new("/tickets/#{id}#{query}").resource(id: id).get
      end

      def list(query: "")
        new("/tickets#{query}").resource.get
      end

      def update(id:, params: {})
        new("/tickets/#{id}").resource(id: id, params: params).put
      end

      def delete(id:)
        new("/tickets/#{id}").resource(id: id).delete
      end

      def restore(id:)
        new("/tickets/#{id}/restore").resource(id: id).put
      end

      def list_all_fields
        new('/ticket_fields').resource.get
      end

      def list_all_conversations(id:)
        new("/tickets/#{id}/conversations").resource(id: id).get
      end

      def list_all_time_entries(id:)
        new("/tickets/#{id}/time_entries").resource(id: id).get
      end

      def list_all_satisfaction_ratings(ticket_id:)
        new("/tickets/#{ticket_id}/satisfaction_ratings").resource.get
      end

      def search(query: '')
        new("/search/tickets?query=\"#{query}\"").resource.get
      end
    end
  end
end
