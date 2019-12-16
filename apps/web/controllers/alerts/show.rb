module Web
  module Controllers
    module Alerts
      class Show < BaseController
        include Web::Action

        expose :alert

        def call(params)
          @alert = repository.find(params[:id])
        end
      end
    end
  end
end
