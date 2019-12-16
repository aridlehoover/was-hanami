describe String do
  describe '#pluralize' do
    context 'regular nouns' do
      it 'appends s to the string' do
        expect('cat'.pluralize).to eq('cats')
        expect('dog'.pluralize).to eq('dogs')
      end
    end

    context 'noun ends in s' do
      it 'appends es to the string' do
        expect('bus'.pluralize).to eq('buses')
        expect('alias'.pluralize).to eq('aliases')
        expect('status'.pluralize).to eq('statuses')
      end
    end

    context 'noun ends in ss' do
      it 'appends es to the string' do
        expect('truss'.pluralize).to eq('trusses')
      end
    end

    context 'noun ends in sh' do
      it 'appends es to the string' do
        expect('marsh'.pluralize).to eq('marshes')
      end
    end

    context 'noun ends in ch' do
      it 'appends es to the string' do
        expect('lunch'.pluralize).to eq('lunches')
      end
    end

    context 'noun ends in o' do
      it 'appends es to the string' do
        expect('potato'.pluralize).to eq('potatoes')
      end
    end

    context 'noun ends in x' do
      it 'appends es to the string' do
        expect('tax'.pluralize).to eq('taxes')
        expect('fox'.pluralize).to eq('foxes')
      end
    end

    context 'noun ends in z' do
      it 'appends es to the string' do
        expect('blitz'.pluralize).to eq('blitzes')
      end
    end

    context 'noun ends in a vowel and z' do
      it 'appends zes to the string' do
        expect('fez'.pluralize).to eq('fezzes')
        expect('quiz'.pluralize).to eq('quizzes')
      end
    end

    context 'noun ends in fe' do
      it 'converts the fe to ves' do
        expect('wife'.pluralize).to eq('wives')
      end
    end

    context 'noun ends in a vowel and f' do
      it 'converts the f to ves' do
        expect('hoof'.pluralize).to eq('hooves')
      end
    end

    context 'noun ends in a consonant and y' do
      it 'converts the y to ies' do
        expect('city'.pluralize).to eq('cities')
      end
    end

    context 'noun ends in a vowel and y' do
      it 'appends s to the string' do
        expect('boy'.pluralize).to eq('boys')
      end
    end

    context 'noun ends in a us' do
      it 'converts us to i' do
        expect('cactus'.pluralize).to eq('cacti')
        expect('nucleus'.pluralize).to eq('nuclei')
      end
    end

    context 'noun ends in a on' do
      it 'converts on to a' do
        expect('phenomenon'.pluralize).to eq('phenomena')
      end
    end

    context 'noun ends in oot or ooth' do
      it 'converts oot to eet' do
        expect('tooth'.pluralize).to eq('teeth')
        expect('foot'.pluralize).to eq('feet')
      end
    end

    context 'noun ends in ex' do
      it 'converst ex to ices' do
        expect('vertex'.pluralize).to eq('vertices')
        expect('index'.pluralize).to eq('indices')
      end
    end

    context 'noun ends in ix' do
      it 'converst ix to ices' do
        expect('matrix'.pluralize).to eq('matrices')
      end
    end

    context 'noun ends in um' do
      it 'converts um to a' do
        expect('bacterium'.pluralize).to eq('bacteria')
        expect('datum'.pluralize).to eq('data')
      end
    end

    context 'noun ends in ion' do
      it 'converts um to ia' do
        expect('criterion'.pluralize).to eq('criteria')
      end
    end

    context 'noun ends in man' do
      it 'converts man to men' do
        expect('fisherman'.pluralize).to eq('fishermen')
      end
    end

    context 'noun ends in sis' do
      it 'converts sis to ses' do
        expect('ellipsis'.pluralize).to eq('ellipses')
        expect('axis'.pluralize).to eq('axes')
        expect('testis'.pluralize).to eq('testes')
      end
    end

    context 'noun ends with ouse' do
      it 'converts ouse to ice' do
        expect('mouse'.pluralize).to eq('mice')
      end
    end

    context 'noun ends with ouse' do
      it 'converts ouse to ice' do
        expect('mouse'.pluralize).to eq('mice')
      end
    end

    context 'noun ends with ice' do
      it 'does not change word' do
        expect('lice'.pluralize).to eq('lice')
      end
    end

    context 'noun is ox or oxen' do
      it 'returns oxen' do
        expect('ox'.pluralize).to eq('oxen')
        expect('oxen'.pluralize).to eq('oxen')
      end
    end

    context 'noun ends with ia' do
      it 'does not change word' do
        expect('militia'.pluralize).to eq('militia')
      end
    end

    context 'noun ends with sis' do
      it 'converts sis to ses' do
        expect('ellipsis'.pluralize).to eq('ellipses')
      end
    end

    context 'irregulars' do
      it 'translates from person to people' do
        expect('person'.pluralize).to eq('people')
        expect('child'.pluralize).to eq('children')
        expect('zombie'.pluralize).to eq('zombies')
      end
    end

    context 'uncountables' do
      it 'does not change word' do
        expect('equipment'.pluralize).to eq('equipment')
        expect('information'.pluralize).to eq('information')
        expect('rice'.pluralize).to eq('rice')
        expect('money'.pluralize).to eq('money')
        expect('species'.pluralize).to eq('species')
        expect('series'.pluralize).to eq('series')
        expect('fish'.pluralize).to eq('fish')
        expect('sheep'.pluralize).to eq('sheep')
        expect('jeans'.pluralize).to eq('jeans')
        expect('police'.pluralize).to eq('police')
      end
    end
  end

  describe '#singularize' do
    context 'noun is databases' do
      it 'removes the s from the end of the word' do
        expect('databases'.singularize).to eq('database')
      end
    end

    context 'noun ends in zzes' do
      it 'replaces zzes with z' do
        expect('quizzes'.singularize).to eq('quiz')
      end
    end

    context 'noun ends in ices' do
      it 'replaces ices with ix' do
        expect('matrices'.singularize).to eq('matrix')
      end
    end

    context 'noun ends in ices' do
      it 'replaces ices with ex' do
        expect('vertices'.singularize).to eq('vertex')
        expect('indices'.singularize).to eq('index')
      end
    end

    context 'noun is oxen' do
      it 'removes en from end of word' do
        expect('oxen'.singularize).to eq('ox')
      end
    end

    context 'noun is aliases or statuses' do
      it 'removes es from end of word' do
        expect('aliases'.singularize).to eq('alias')
        expect('statuses'.singularize).to eq('status')
      end
    end

    context 'noun is octopi or virus' do
      it 'replaces i with us' do
        expect('octopi'.singularize).to eq('octopus')
        expect('virus'.singularize).to eq('virus')
      end
    end

    context 'noun is axes' do
      it 'replaces es with is' do
        expect('axes'.singularize).to eq('axis')
      end
    end

    context 'noun is crises or testes' do
      it 'replaces es with is' do
        expect('crises'.singularize).to eq('crisis')
        expect('testes'.singularize).to eq('testis')
      end
    end

    context 'noun is shoes' do
      it 'removes s from end of word' do
        expect('shoes'.singularize).to eq('shoe')
      end
    end

    context 'noun ends with oes' do
      it 'replaces oes with o' do
        expect('tomatoes'.singularize).to eq('tomato')
        expect('potatoes'.singularize).to eq('potato')
      end
    end

    context 'noun is buses' do
      it 'removes es from end of word' do
        expect('buses'.singularize).to eq('bus')
      end
    end

    context 'noun ends with ice' do
      it 'replaces ice with ouse' do
        expect('mice'.singularize).to eq('mouse')
      end
    end

    context 'noun ends in xes, ches, sses, or shes' do
      it 'removes es from end of string' do
        expect('taxes'.singularize).to eq('tax')
        expect('churches'.singularize).to eq('church')
        expect('duchesses'.singularize).to eq('duchess')
        expect('dashes'.singularize).to eq('dash')
      end
    end

    context 'noun is movies' do
      it 'removes s from the end of the word' do
        expect('movies'.singularize).to eq('movie')
      end
    end

    context 'noun is series' do
      it 'does not change the word' do
        expect('series'.singularize).to eq('series')
      end
    end

    context 'noun ends in ies' do
      it 'replaces ies with y' do
        expect('butterflies'.singularize).to eq('butterfly')
        expect('queries'.singularize).to eq('query')
      end
    end

    context 'noun is wolves' do
      it 'replaces ves with f' do
        expect('wolves'.singularize).to eq('wolf')
      end
    end

    context 'noun ends in hives or tives' do
      it 'removes s from end of word' do
        expect('hives'.singularize).to eq('hive')
        expect('actives'.singularize).to eq('active')
      end
    end

    context 'noun ends in ves' do
      it 'replaces ves with fe' do
        expect('wives'.singularize).to eq('wife')
      end
    end

    context 'noun ends in ses or sis' do
      it 'replaces ses with sis' do
        expect('analyses'.singularize).to eq('analysis')
        expect('bases'.singularize).to eq('basis')
        expect('diagnoses'.singularize).to eq('diagnosis')
        expect('prognoses'.singularize).to eq('prognosis')
        expect('synopses'.singularize).to eq('synopsis')
        expect('theses'.singularize).to eq('thesis')
      end
    end

    context 'noun ends in ia' do
      it 'replaces ia with um' do
        expect('bacteria'.singularize).to eq('bacterium')
      end
    end

    context 'noun is news' do
      it 'does not change word' do
        expect('news'.singularize).to eq('news')
      end
    end

    context 'noun ends in ss' do
      it 'does not change word' do
        expect('mess'.singularize).to eq('mess')
      end
    end

    context 'regular nouns' do
      it 'appends s to the string' do
        expect('cats'.singularize).to eq('cat')
        expect('dogs'.singularize).to eq('dog')
      end
    end

    context 'irregulars' do
      it 'translates from people to person' do
        expect('people'.singularize).to eq('person')
        expect('children'.singularize).to eq('child')
        expect('zombies'.singularize).to eq('zombie')
      end
    end

    context 'uncountables' do
      it 'does not change word' do
        expect('equipment'.singularize).to eq('equipment')
        expect('information'.singularize).to eq('information')
        expect('rice'.singularize).to eq('rice')
        expect('money'.singularize).to eq('money')
        expect('species'.singularize).to eq('species')
        expect('series'.singularize).to eq('series')
        expect('fish'.singularize).to eq('fish')
        expect('sheep'.singularize).to eq('sheep')
        expect('jeans'.singularize).to eq('jeans')
        expect('police'.singularize).to eq('police')
      end
    end
  end
end