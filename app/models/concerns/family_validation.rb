module FamilyValidation
  extend ActiveSupport::Concern

  def cannot_younger_than(age, type)
    errors.add(:too_young, "You need to be older than #{age} years old to be a #{type}.") if self.first_family_member.age < 20
  end

  def must_be_male
    if self.type == 'Brother'
      errors.add(:not_male, "You must be a Male") if self.second_family_member.gender != 'Male'
    else
      errors.add(:not_male, "You must be a Male") if self.first_family_member.gender != 'Male'
    end
  end

  def must_be_female
    if self.type == 'Sister'
      errors.add(:not_female, "You must be a Female") if self.second_family_member.gender != 'Female'
    else
      errors.add(:not_female, "You must be a Female") if self.first_family_member.gender != 'Female'
    end
  end

  def only_one_parent_each
    father = Father.where(second_family_member: self.first_family_member.id)
    mother = Mother.where(second_family_member: self.first_family_member.id)
    if father.count > 1 or mother.count > 1
      errors.add(:too_many, "Parents, you can have one Father and Mother")
    end
  end
end
