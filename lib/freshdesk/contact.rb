module Freshdesk
  class Contact < FreshdeskObject
    class << self
      def create(params: {})
        new('/contacts').resource(params: params).post
      end

      def retrieve(id:, query: '')
        new("/contacts/#{id}#{query}").resource(id: id).get
      end

      def list(query: '')
        new("/contacts#{query}").resource.get
      end

      def update(id:, params: {})
        new("/contacts/#{id}").resource(id: id, params: params).put
      end

      def delete(id:)
        new("/contacts/#{id}").resource(id: id).delete
      end

      def list_all_fields
        new('/contact_fields').resource.get
      end
    end
  end
end
