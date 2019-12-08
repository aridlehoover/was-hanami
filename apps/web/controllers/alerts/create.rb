module Web
  module Controllers
    module Alerts
      class Create
        include Web::Action

        def initialize(repository = AlertRepository.new)
          @repository = repository
        end

        def call(params)
          @repository.create(params[:alert])

          redirect_to routes.alerts_path
        end
      end
    end
  end
end
