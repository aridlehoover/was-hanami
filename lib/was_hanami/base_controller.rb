class BaseController
  attr_reader :repository

  def initialize(repository = RepositoryFactory.build(self.class.name))
    @repository = repository
  end
end
