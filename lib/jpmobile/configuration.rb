module Jpmobile
  class Configuration
    include Singleton

    attr_accessor :form_accept_charset_conversion, :smart_phone_emoticon_compatibility, :fallback_view_selector

    def initialize
      @form_accept_charset_conversion     = false
      @smart_phone_emoticon_compatibility = false
      @fallback_view_selector             = false
    end

    def mobile_filter
      ::Jpmobile.mount_middlewares
    end

    def session_store(&block)
      @session_store = block
    end

    def mount_session_store
      @session_store && @session_store.call
    end

    module RailsConfiguration
      def jpmobile
        @jpmobile ||= ::Jpmobile.config
      end
    end
  end
end
