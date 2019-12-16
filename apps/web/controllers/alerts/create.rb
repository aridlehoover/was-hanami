module Web
  module Controllers
    module Alerts
      class Create < BaseController
        include Web::Action

        def call(params)
          repository.create(params[:alert])

          redirect_to routes.alerts_path
        end
      end
    end
  end
end
