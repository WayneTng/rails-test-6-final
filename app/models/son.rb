class Son < Family
  include FamilyValidation

  validate :must_be_male, :only_one_parent_each
end
