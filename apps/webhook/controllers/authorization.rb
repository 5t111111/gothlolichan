module Webhook
  module Authorization
    def self.included(action)
      action.class_eval do
        before :check_webhook_secret
      end
    end

    private

    def check_webhook_secret
      request.body.rewind
      payload = request.body.read
      signature = "sha1=#{OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['WEBHOOK_SECRET'], payload)}"
      halt 403, 'Webhook secret is required' \
        unless ::Rack::Utils.secure_compare(signature, request.env['HTTP_X_HUB_SIGNATURE'])
    end
  end
end
