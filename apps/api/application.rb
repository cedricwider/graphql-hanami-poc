require 'hanami/helpers'
require 'hanami/assets'

module Api
  class Application < Hanami::Application
    configure do
      root __dir__

      # Relative load paths where this application will recursively load the code.
      # When you add new directories, remember to add them here.
      #
      load_paths << [
        'controllers',
        'types'
      ]
      routes 'config/routes'
      security.x_frame_options 'DENY'
      security.x_content_type_options 'nosniff'
      security.x_xss_protection '1; mode=block'
      security.content_security_policy %{
        form-action 'self';
        frame-ancestors 'self';
        base-uri 'self';
        default-src 'none';
        script-src 'self';
        connect-src 'self';
        img-src 'self' https: data:;
        style-src 'self' 'unsafe-inline' https:;
        font-src 'self';
        object-src 'none';
        plugin-types application/pdf;
        child-src 'self';
        frame-src 'self';
        media-src 'self'
      }
      controller.prepare do
        # include MyAuthentication # included in all the actions
        # before :authenticate!    # run an authentication before callback
      end
    end

    configure :development do
      # Don't handle exceptions, render the stack trace
      handle_exceptions false

      # Logger
      # See: http://hanamirb.org/guides/applications/logging
      #
      # Logger stream. It defaults to STDOUT.
      # logger.stream "log/development.log"
      #
      # Logger level. It defaults to DEBUG
      # logger.level :debug
      #
      # Logger format. It defaults to DEFAULT
      # logger.format :default
    end

    ##
    # TEST
    #
    configure :test do
      # Don't handle exceptions, render the stack trace
      handle_exceptions false

      # Logger
      # See: http://hanamirb.org/guides/applications/logging
      #
      # Logger level. It defaults to ERROR
      logger.level :error
    end

    ##
    # PRODUCTION
    #
    configure :production do
      # scheme 'https'
      # host   'example.org'
      # port   443

      # Logger
      # See: http://hanamirb.org/guides/applications/logging
      #
      # Logger stream. It defaults to STDOUT.
      # logger.stream "log/production.log"
      #
      # Logger level. It defaults to INFO
      logger.level :info

      # Logger format.
      logger.format :json

      assets do
        # Don't compile static assets in production mode (eg. Sass, ES6)
        #
        # See: http://www.rubydoc.info/gems/hanami-assets#Configuration
        compile false

        # Use digest file name for asset paths
        #
        # See: http://hanamirb.org/guides/assets/overview
        digest  true

        # Content Delivery Network (CDN)
        #
        # See: http://hanamirb.org/guides/assets/content-delivery-network
        #
        # scheme 'https'
        # host   'cdn.example.org'
        # port   443

        # Subresource Integrity
        #
        # See: http://hanamirb.org/guides/assets/subresource-integrity
        subresource_integrity :sha256
      end
    end
  end
end
