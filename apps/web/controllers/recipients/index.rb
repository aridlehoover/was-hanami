module Web
  module Controllers
    module Recipients
      class Index
        include Web::Action

        def initialize(repository = RecipientRepository.new)
          @repository = repository
        end

        expose :recipients

        def call(params)
          @recipients = @repository.all
        end
      end
    end
  end
end
