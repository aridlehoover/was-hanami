module Web
  module Controllers
    module Alerts
      class Show
        include Web::Action

        def initialize(repository = AlertRepository.new)
          @repository = repository
        end

        expose :alert

        def call(params)
          @alert = @repository.find(params[:id])
        end
      end
    end
  end
end
