require 'rails_helper'

describe Parser do
  let(:extended_class) { Class.new { extend Parser } }

  describe 'link' do
    it '`s number should equal the number of letters' do
      expect(extended_class.get_links.length).to eq 30
    end

    it 'should begin from general adress' do
      extended_class.get_links.each do |link|
        expect(link[0..31]).to eq 'http://urfu.ru/ru/alpha/full/?a='
      end
    end
  end

  describe 'statement' do
    it 'should be empty' do
      statement = { user_name: 'Абаимов Владислав Владимирович', number: 81_712, status: 'Рейтинг', specialty: '38.03.01 Экономика (Бакалавриат)', educational_program: 'Прикладная экономика и финансы (ВШЭМ)', study_mode: 'Заочная', basis: 'контрактная основа', points: 0 }
      expect(extended_class.statement_empty?(statement)).to eq(true)
    end

    it 'should be not empty' do
      statement = { user_name: 'Абаимов Владислав Владимирович', number: 81_712, status: 'Рейтинг', specialty: '38.03.01 Экономика (Бакалавриат)', educational_program: 'Прикладная экономика и финансы (ВШЭМ)', study_mode: 'Заочная', basis: 'контрактная основа', points: 236 }
      expect(extended_class.statement_empty?(statement)).to eq(false)
    end

    it 'should be equal first statement from first page' do
      link = extended_class.get_links.first
      statements = extended_class.statements_by_page(link)
      expect(statements.first).to eq(user_name: 'Абаимов Владислав Владимирович', number: 81_712, status: 'Рейтинг', specialty: '38.03.01 Экономика (Бакалавриат)', educational_program: 'Прикладная экономика и финансы (ВШЭМ)', study_mode: 'Заочная', basis: 'контрактная основа', points: 236)
    end

    it 'should be save' do
      statement = { user_name: 'Абаимов Владислав Владимирович', number: 81_712, status: 'Рейтинг', specialty: '38.03.01 Экономика (Бакалавриат)', educational_program: 'Прикладная экономика и финансы (ВШЭМ)', study_mode: 'Заочная', basis: 'контрактная основа', points: 236 }
      extended_class.save_statements([statement, statement])
    end
  end
end
