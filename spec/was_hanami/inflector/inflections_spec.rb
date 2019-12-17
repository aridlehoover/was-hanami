require 'spec_helper'

describe Inflector do
  subject(:inflector) { described_class }

  describe 'plurals' do
    it 'appends zes to words ending in a vowel and a z' do
      expect(inflector.pluralize('quiz')).to eq('quizzes')
      expect(inflector.pluralize('fez')).to eq('fezzes')
    end

    it 'correctly pluralizes oxen and ox to oxen' do
      expect(inflector.pluralize('oxen')).to eq('oxen')
      expect(inflector.pluralize('ox')).to eq('oxen')
    end

    it 'correctly pluralizes mice and lice to mice and lice' do
      expect(inflector.pluralize('mice')).to eq('mice')
      expect(inflector.pluralize('lice')).to eq('lice')
    end

    it 'correctly pluralizes mouse and louse to mice and lice' do
      expect(inflector.pluralize('mouse')).to eq('mice')
      expect(inflector.pluralize('louse')).to eq('lice')
    end

    it 'replaces ix or ex with ices' do
      expect(inflector.pluralize('index')).to eq('indices')
      expect(inflector.pluralize('matrix')).to eq('matrices')
    end

    it 'appends es to words ending in x, ch, ss, and sh' do
      expect(inflector.pluralize('tax')).to eq('taxes')
      expect(inflector.pluralize('church')).to eq('churches')
      expect(inflector.pluralize('kiss')).to eq('kisses')
      expect(inflector.pluralize('dish')).to eq('dishes')
    end

    it 'replaces y at end of string with ies' do
      expect(inflector.pluralize('pony')).to eq('ponies')
      expect(inflector.pluralize('query')).to eq('queries')
    end

    it 'appends s to the end of hive' do
      expect(inflector.pluralize('hive')).to eq('hives')
    end

    it 'replaces fe with ves except words ending in ffe' do
      expect(inflector.pluralize('giraffe')).to eq('giraffes')
      expect(inflector.pluralize('wife')).to eq('wives')
      expect(inflector.pluralize('wolf')).to eq('wolves')
      expect(inflector.pluralize('wharf')).to eq('wharves')
    end

    it 'replaces sis with ses' do
      expect(inflector.pluralize('psychosis')).to eq('psychoses')
    end

    it 'does not change words ending in ta or ia' do
      expect(inflector.pluralize('data')).to eq('data')
      expect(inflector.pluralize('militia')).to eq('militia')
    end

    it 'replaces um with a in words ending in tum or ium' do
      expect(inflector.pluralize('sanctum')).to eq('sancta')
      expect(inflector.pluralize('millenium')).to eq('millenia')
    end

    it 'appends es to words ending in a consonant and an o' do
      expect(inflector.pluralize('buffalo')).to eq('buffaloes')
      expect(inflector.pluralize('tomato')).to eq('tomatoes')
      expect(inflector.pluralize('potato')).to eq('potatoes')
    end

    it 'appends es to bus' do
      expect(inflector.pluralize('bus')).to eq('buses')
    end

    it 'appends es to alias and status' do
      expect(inflector.pluralize('alias')).to eq('aliases')
      expect(inflector.pluralize('status')).to eq('statuses')
    end

    it 'does not change octopi or viri' do
      expect(inflector.pluralize('octopi')).to eq('octopi')
      expect(inflector.pluralize('viri')).to eq('viri')
    end

    it 'replaces us with i for octopus or virus' do
      expect(inflector.pluralize('octopus')).to eq('octopi')
      expect(inflector.pluralize('virus')).to eq('viri')
    end

    it 'replaces is with es' do
      expect(inflector.pluralize('axis')).to eq('axes')
      expect(inflector.pluralize('testis')).to eq('testes')
    end

    it 'does not change words that end in one s' do
      expect(inflector.pluralize('dogs')).to eq('dogs')
      expect(inflector.pluralize('cats')).to eq('cats')
    end

    it 'appends s' do
      expect(inflector.pluralize('dog')).to eq('dogs')
      expect(inflector.pluralize('cat')).to eq('cats')
    end
  end

  context 'irregulars' do
    it 'translates from person to people' do
      expect(inflector.pluralize('person')).to eq('people')
      expect(inflector.pluralize('child')).to eq('children')
      expect(inflector.pluralize('zombie')).to eq('zombies')
    end
  end

  context 'uncountables' do
    it 'does not change word' do
      expect(inflector.pluralize('equipment')).to eq('equipment')
      expect(inflector.pluralize('information')).to eq('information')
      expect(inflector.pluralize('rice')).to eq('rice')
      expect(inflector.pluralize('money')).to eq('money')
      expect(inflector.pluralize('species')).to eq('species')
      expect(inflector.pluralize('series')).to eq('series')
      expect(inflector.pluralize('fish')).to eq('fish')
      expect(inflector.pluralize('sheep')).to eq('sheep')
      expect(inflector.pluralize('jeans')).to eq('jeans')
      expect(inflector.pluralize('police')).to eq('police')
    end
  end

  describe '#singularize' do
    context 'noun is databases' do
      it 'removes the s from the end of the word' do
        expect(inflector.singularize('databases')).to eq('database')
      end
    end

    context 'noun ends in zzes' do
      it 'replaces zzes with z' do
        expect(inflector.singularize('quizzes')).to eq('quiz')
      end
    end

    context 'noun ends in ices' do
      it 'replaces ices with ix' do
        expect(inflector.singularize('matrices')).to eq('matrix')
      end
    end

    context 'noun ends in ices' do
      it 'replaces ices with ex' do
        expect(inflector.singularize('vertices')).to eq('vertex')
        expect(inflector.singularize('indices')).to eq('index')
      end
    end

    context 'noun is oxen' do
      it 'removes en from end of word' do
        expect(inflector.singularize('oxen')).to eq('ox')
      end
    end

    context 'noun is aliases or statuses' do
      it 'removes es from end of word' do
        expect(inflector.singularize('aliases')).to eq('alias')
        expect(inflector.singularize('statuses')).to eq('status')
      end
    end

    context 'noun is octopi or virus' do
      it 'replaces i with us' do
        expect(inflector.singularize('octopi')).to eq('octopus')
        expect(inflector.singularize('virus')).to eq('virus')
      end
    end

    context 'noun is axes' do
      it 'replaces es with is' do
        expect(inflector.singularize('axes')).to eq('axis')
      end
    end

    context 'noun is crises or testes' do
      it 'replaces es with is' do
        expect(inflector.singularize('crises')).to eq('crisis')
        expect(inflector.singularize('testes')).to eq('testis')
      end
    end

    context 'noun is shoes' do
      it 'removes s from end of word' do
        expect(inflector.singularize('shoes')).to eq('shoe')
      end
    end

    context 'noun ends with oes' do
      it 'replaces oes with o' do
        expect(inflector.singularize('tomatoes')).to eq('tomato')
        expect(inflector.singularize('potatoes')).to eq('potato')
      end
    end

    context 'noun is buses' do
      it 'removes es from end of word' do
        expect(inflector.singularize('buses')).to eq('bus')
      end
    end

    context 'noun ends with ice' do
      it 'replaces ice with ouse' do
        expect(inflector.singularize('mice')).to eq('mouse')
      end
    end

    context 'noun ends in xes, ches, sses, or shes' do
      it 'removes es from end of string' do
        expect(inflector.singularize('taxes')).to eq('tax')
        expect(inflector.singularize('churches')).to eq('church')
        expect(inflector.singularize('duchesses')).to eq('duchess')
        expect(inflector.singularize('dashes')).to eq('dash')
      end
    end

    context 'noun is movies' do
      it 'removes s from the end of the word' do
        expect(inflector.singularize('movies')).to eq('movie')
      end
    end

    context 'noun is series' do
      it 'does not change the word' do
        expect(inflector.singularize('series')).to eq('series')
      end
    end

    context 'noun ends in ies' do
      it 'replaces ies with y' do
        expect(inflector.singularize('butterflies')).to eq('butterfly')
        expect(inflector.singularize('queries')).to eq('query')
      end
    end

    context 'noun is wolves' do
      it 'replaces ves with f' do
        expect(inflector.singularize('wolves')).to eq('wolf')
      end
    end

    context 'noun ends in hives or tives' do
      it 'removes s from end of word' do
        expect(inflector.singularize('hives')).to eq('hive')
        expect(inflector.singularize('actives')).to eq('active')
      end
    end

    context 'noun ends in ves' do
      it 'replaces ves with fe' do
        expect(inflector.singularize('wives')).to eq('wife')
      end
    end

    context 'noun ends in ses or sis' do
      it 'replaces ses with sis' do
        expect(inflector.singularize('analyses')).to eq('analysis')
        expect(inflector.singularize('bases')).to eq('basis')
        expect(inflector.singularize('diagnoses')).to eq('diagnosis')
        expect(inflector.singularize('prognoses')).to eq('prognosis')
        expect(inflector.singularize('synopses')).to eq('synopsis')
        expect(inflector.singularize('theses')).to eq('thesis')
      end
    end

    context 'noun ends in ia' do
      it 'replaces ia with um' do
        expect(inflector.singularize('bacteria')).to eq('bacterium')
      end
    end

    context 'noun is news' do
      it 'does not change word' do
        expect(inflector.singularize('news')).to eq('news')
      end
    end

    context 'noun ends in ss' do
      it 'does not change word' do
        expect(inflector.singularize('mess')).to eq('mess')
      end
    end

    context 'regular nouns' do
      it 'appends s to the string' do
        expect(inflector.singularize('cats')).to eq('cat')
        expect(inflector.singularize('dogs')).to eq('dog')
      end
    end

    context 'irregulars' do
      it 'translates from people to person' do
        expect(inflector.singularize('people')).to eq('person')
        expect(inflector.singularize('children')).to eq('child')
        expect(inflector.singularize('zombies')).to eq('zombie')
      end
    end

    context 'uncountables' do
      it 'does not change word' do
        expect(inflector.singularize('equipment')).to eq('equipment')
        expect(inflector.singularize('information')).to eq('information')
        expect(inflector.singularize('rice')).to eq('rice')
        expect(inflector.singularize('money')).to eq('money')
        expect(inflector.singularize('species')).to eq('species')
        expect(inflector.singularize('series')).to eq('series')
        expect(inflector.singularize('fish')).to eq('fish')
        expect(inflector.singularize('sheep')).to eq('sheep')
        expect(inflector.singularize('jeans')).to eq('jeans')
        expect(inflector.singularize('police')).to eq('police')
      end
    end
  end
end