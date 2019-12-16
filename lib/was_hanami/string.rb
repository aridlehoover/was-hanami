class String
  PLURAL_PATTERNS = [
    [/sis$/i, "ses"],
    [/([ti])a$/i, '\1a'],
    [/^(m|l)ice$/i, '\1ice'],
    [/^(ox)$/i, '\1en'],
    [/^(oxen)$/i, '\1'],
    [/^(m|l)ouse$/i, '\1ice'],
    [/man$/, 'men'],
    [/(matr|vert|ind)(?:ix|ex)$/i, '\1ices'],
    [/oot(h?)$/, 'eet\1'],
    [/(?:on|um)$/, 'a'],
    [/(octop|vir|cact|nucle)us$/i, '\1i'],
    [/([^aeiouy]|qu)y$/i, '\1ies'],
    [/(oo)f$/i, '\1ves'],
    [/([^f])fe|([lr])f$/i, '\1\2ves'],
    [/([aeiou]z)$/i, '\1zes'],
    [/(buffal|tomat|potat)o$/i, '\1oes'],
    [/is$/, 'es'],
    [/([ch|s|sh|x|z])$/i, '\1es'],
    [/$/, "s"]
  ]

  SINGULAR_PATTERNS = [
    [/(database)s$/i, '\1'],
    [/(quiz)zes$/i, '\1'],
    [/(matr)ices$/i, '\1ix'],
    [/(vert|ind)ices$/i, '\1ex'],
    [/^(ox)en$/i, '\1'],
    [/(alias|status)(es)?$/i, '\1'],
    [/(octop|vir)(us|i)$/i, '\1us'],
    [/^(a)x[ie]s$/i, '\1xis'],
    [/(cris|test)(is|es)$/i, '\1is'],
    [/(shoe)s$/i, '\1'],
    [/(o)es$/i, '\1'],
    [/(bus)(es)?$/i, '\1'],
    [/^(m|l)ice$/i, '\1ouse'],
    [/(x|ch|ss|sh)es$/i, '\1'],
    [/(m)ovies$/i, '\1ovie'],
    [/(s)eries$/i, '\1eries'],
    [/([^aeiouy]|qu)ies$/i, '\1y'],
    [/([lr])ves$/i, '\1f'],
    [/(tive)s$/i, '\1'],
    [/(hive)s$/i, '\1'],
    [/([^f])ves$/i, '\1fe'],
    [/((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)(sis|ses)$/i, '\1sis'],
    [/([ti])a$/i, '\1um'],
    [/(n)ews$/i, '\1ews'],
    [/(ss)$/i, '\1'],
    [/s$/i, ""]
  ].freeze

  IRREGULAR_PATTERNS = [
    ["person", "people"],
    ["man", "men"],
    ["child", "children"],
    ["sex", "sexes"],
    ["move", "moves"],
    ["zombie", "zombies"]
  ].freeze

  UNCOUNTABLES = %w(equipment information rice money species series fish sheep jeans police).freeze

  def pluralize
    return self if UNCOUNTABLES.include?(self)

    IRREGULAR_PATTERNS.each do | singular, plural |
      return self if self.sub!(singular, plural)
    end

    match_and_replace(PLURAL_PATTERNS)
  end

  def singularize
    return self if UNCOUNTABLES.include?(self)

    IRREGULAR_PATTERNS.each do | singular, plural |
      return self if self.sub!(plural, singular)
    end

    match_and_replace(SINGULAR_PATTERNS)
  end

  private

  def match_and_replace(patterns)
    patterns.each do | pattern, replacement |
      return self if self.sub!(pattern, replacement)
    end
  end
end
