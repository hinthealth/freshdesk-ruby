module Freshdesk
  class Company < FreshdeskObject
    class << self
      def create(params: {})
        response = new('/companies').resource(params: params).post
        set_attrs_from_response(response)
      end

      def retrieve(id:, query: '')
        response = new("/companies/#{id}#{query}").resource(id: id).get
        set_attrs_from_response(response)
      end

      def list(query: '')
        new("/companies#{query}").resource.get
      end

      def update(id:, params: {})
        new("/companies/#{id}").resource(id: id, params: params).put
      end

      def delete(id:)
        new("/companies/#{id}").resource(id: id).delete
      end

      def list_all_fields
        new('/company_fields').resource.get
      end
    end
  end
end
