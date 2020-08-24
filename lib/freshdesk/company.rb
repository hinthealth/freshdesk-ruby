module Freshdesk
  class Company < FreshdeskObject
    class << self
      def create(params: {})
        new('/companies').resource(params: params).post
      end

      def retrieve(id:, query: '')
        new("/companies/#{id}#{query}").resource(id: id).get
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
