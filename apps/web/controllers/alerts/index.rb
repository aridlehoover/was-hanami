module Web
  module Controllers
    module Alerts
      class Index
        include Web::Action

        expose :alerts

        def initialize(repository = AlertRepository.new)
          @repository = repository
        end

        def call(params)
          @alerts = @repository.all
        end
      end
    end
  end
end
