class Daughter < Family
  include FamilyValidation

  validate :must_be_female, :only_one_parent_each
end
