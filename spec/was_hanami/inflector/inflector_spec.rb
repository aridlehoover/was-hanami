require 'spec_helper'

describe Inflector do
  subject(:inflections) { described_class.inflections }

  describe '#plural' do
    subject(:plural) { inflections.plural('rule', 'replacement') }

    before { plural }

    it 'adds a rule to the inflector' do
      expect(described_class.inflections.plurals).to include(['rule', 'replacement'])
    end

    it 'makes rule available to pluralize method' do
      expect(described_class.pluralize('rule')).to eq('replacement')
    end
  end

  describe '#singular' do
    subject(:singular) { inflections.singular('rule', 'replacement') }

    before { singular }

    it 'adds a rule to the inflector' do
      expect(described_class.inflections.singulars).to include(['rule', 'replacement'])
    end

    it 'makes rule available to singularize method' do
      expect(described_class.singularize('rule')).to eq('replacement')
    end
  end

  describe '#irregular' do
    subject(:irregular) { inflections.irregular('rule', 'replacement') }

    before { irregular }

    it 'adds two rule to the inflector' do
      expect(inflections.plurals).to include(['rule', 'replacement'])
      expect(inflections.singulars).to include(['replacement', 'rule'])
    end

    it 'makes rule available to pluralize method' do
      expect(described_class.pluralize('rule')).to eq('replacement')
    end

    it 'makes rule available to singularize method' do
      expect(described_class.singularize('replacement')).to eq('rule')
    end
  end

  describe '#uncountable' do
    subject(:uncountable) { described_class.inflections.uncountable(['equipment', 'money'])}

    before { uncountable }

    it 'does not pluralize the uncountables' do
      expect(described_class.pluralize('equipment')).to eq('equipment')
      expect(described_class.pluralize('money')).to eq('money')
    end

    it 'does not singularize the uncountables' do
      expect(described_class.singularize('equipment')).to eq('equipment')
      expect(described_class.singularize('money')).to eq('money')
    end
  end
end
