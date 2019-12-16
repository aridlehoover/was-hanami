module Web
  module Controllers
    module Alerts
      class Index < BaseController
        include Web::Action

        expose :alerts

        def call(params)
          @alerts = repository.all
        end
      end
    end
  end
end
