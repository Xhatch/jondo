module Jondo
  class Client
    # Defines methods related to users
    module Users
      # Returns extended information of a given user
      #
      # @overload user(id=nil, options={})
      #   @param user [Integer] An Jondo user ID
      #   @return [Hashie::Mash] The requested user.
      #   @example Return extended information for @sample
      #     Jondo.user(20)
      # @format :json
      # @authenticated false unless requesting it from a protected user
      #
      #   If getting this data of a protected user, you must authenticate (and be allowed to see that user).
      # @rate_limited true
      # @see TODO:docs url
      def user(*args)
        id = args.first || 'self'
        response = get("users/#{id}")
        response["data"]
      end
  end
end
