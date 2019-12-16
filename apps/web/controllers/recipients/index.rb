module Web
  module Controllers
    module Recipients
      class Index < BaseController
        include Web::Action

        expose :recipients

        def call(params)
          @recipients = repository.all
        end
      end
    end
  end
end
