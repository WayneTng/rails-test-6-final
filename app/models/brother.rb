class Brother < Family
  include FamilyValidation

  validate :must_be_son
end
