require 'concurrent/map'

class Inflector
  @__instance__ = Concurrent::Map.new

  attr_reader :plurals, :singulars, :uncountables

  def initialize
    @plurals, @singulars, @uncountables = [], [], []
  end

  def plural(rule, replacement)
    @plurals.prepend([rule, replacement])
  end

  def singular(rule, replacement)
    @singulars.prepend([rule, replacement])
  end

  def irregular(singular, plural)
    plural(singular, plural)
    singular(plural, singular)
  end

  def uncountable(words)
    words = [words].flatten
    words.each { |word| @uncountables.prepend(word) }
  end

  class << self
    def inflections(locale = :en)
      if block_given?
        yield instance(locale)
      else
        instance(locale)
      end
    end

    def pluralize(word, locale = :en)
      apply_inflections(word, inflections(locale).plurals, locale)
    end

    def singularize(word, locale = :en)
      apply_inflections(word, inflections(locale).singulars, locale)
    end

    private

    def instance(locale = :en)
      @__instance__[locale] ||= new
    end

    def apply_inflections(word, rules, locale = :en)
      result = word.to_s.dup
      return result if instance(locale).uncountables.include?(result)

      rules.each { |rule, replacement| break if result.sub!(rule, replacement) }
      result
    end
  end
end
