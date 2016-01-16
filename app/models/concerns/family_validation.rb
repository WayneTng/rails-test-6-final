module FamilyValidation
  extend ActiveSupport::Concern

  def cannot_younger_than(age, type)
    errors.add(:too_young, "You need to be older than #{age} years old to be a #{type}.") if self.first_family_member.age < 20
  end
end
