module FamilyValidation
  extend ActiveSupport::Concern

  def cannot_younger_than(age, type)
    errors.add(:too_young, "You need to be older than #{age} years old to be a #{type}.") if self.first_family_member.age < 20
  end

  def must_be_male
    errors.add(:not_male, "You must be a Male") if self.first_family_member.gender != 'Male'
  end

  def must_be_female
    errors.add(:not_female, "You must be a Female") if self.first_family_member.gender != 'Female'
  end
end
