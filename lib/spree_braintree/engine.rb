module SpreeBraintree
  class Engine < Rails::Engine
    engine_name 'spree_braintree'

    config.autoload_paths += %W(#{config.root}/lib)
    config.assets.precompile += %w( spree/backend/braintree/spree_braintree.js )

    initializer "spree.gateway.payment_methods", after: "spree.register.payment_methods" do |app|
      app.config.spree.payment_methods << Spree::Gateway::Braintree
    end

    def self.activate
      Rails.application.config.assets.precompile += [
        'lib/assets/javascripts/spree/backend/spree_braintree.js',
      ]

      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
