require 'rails_helper'

RSpec.describe People, type: :model do
  context 'Association' do
    it { is_expected.to have_many(:first_member)  }
    it { is_expected.to have_many(:second_member)  }
  end

  context 'Validation' do
    it { is_expected.to validate_numericality_of(:age).is_greater_than(0) }
  end

  let!(:john)     { create(:people)  }
  let!(:william)  { create(:people, first_name: 'William', age: 20)  }
  let!(:michael)  { create(:people, first_name: 'Michael', age: 18)  }
  let!(:ava)      { create(:people, first_name: 'Ava', age: 16, gender: 'Female')  }
  let!(:mia)      { create(:people, first_name: 'Mia', age: 16, gender: 'Female')  }
  let!(:lily)     { create(:people, first_name: 'Lily', age: '38', gender: 'Female')  }

  let!(:father) { create(:family, first_family_member_id: john.id, second_family_member_id: william.id, role: 'Father') }
  let!(:mother) { create(:family, first_family_member_id: lily.id, second_family_member_id: william.id, role: 'Mother') }

  let!(:john_first_son) { create(:family, first_family_member_id: william.id, second_family_member_id: john.id, role: 'Son') }
  let!(:lily_first_son) { create(:family, first_family_member_id: william.id, second_family_member_id: lily.id, role: 'Son') }

  let!(:john_second_son) { create(:family, first_family_member_id: michael.id, second_family_member_id: john.id, role: 'Son') }
  let!(:lily_second_son) { create(:family, first_family_member_id: michael.id, second_family_member_id: lily.id, role: 'Son') }

  let!(:john_first_daughter) { create(:family, first_family_member_id: ava.id, second_family_member_id: john.id, role: 'Daughter') }
  let!(:lily_first_daughter) { create(:family, first_family_member_id: ava.id, second_family_member_id: lily.id, role: 'Daughter') }

  let!(:john_second_daughter) { create(:family, first_family_member_id: mia.id, second_family_member_id: john.id, role: 'Daughter') }
  let!(:lily_second_daughter) { create(:family, first_family_member_id: mia.id, second_family_member_id: lily.id, role: 'Daughter') }

  describe '#say_something' do
    it 'introduce themself' do
      expect(john.say_something).to eq 'Hello, my name is John Fwz'
    end
  end

  describe '#parents' do
    it 'return the parents' do
      expect(william.parents.first.first_name).to eq 'John'
      expect(william.parents.count).to eq 2
    end
  end

  describe '#father' do
    it 'returns the father' do
      expect(william.father.first_name).to eq 'John'
    end
  end

  describe '#mother' do
    it 'returns the mother' do
      expect(william.mother.first_name).to eq 'Lily'
    end
  end

  describe '#sons' do
    it 'returns the sons' do
      expect(john.sons.first.first_name).to eq 'William'
      expect(john.sons.count).to eq 2
    end
  end

  describe '#daughters' do
    it 'returns the daughters' do
      expect(john.daughters.first.first_name).to eq 'Ava'
      expect(john.daughters.count).to eq 2
    end
  end

  describe '#name' do
    it 'returns the name' do
      expect(john.name).to eq 'John Fwz'
    end
  end
end
