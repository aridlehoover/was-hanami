class RepositoryFactory
  def self.build(action_class_name)
    namespaces = action_class_name.split('::')
    entities_name = namespaces[-2]
    entity_name = entities_name.singularize

    const_get("#{entity_name}Repository").new
  end
end
