class Sister < Family
  include FamilyValidation

  validate :must_be_female
end
