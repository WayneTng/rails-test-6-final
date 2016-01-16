class Brother < Family
  include FamilyValidation

  validate :must_be_male
end
