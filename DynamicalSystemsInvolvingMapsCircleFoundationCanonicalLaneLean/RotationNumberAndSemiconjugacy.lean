import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

structure RotationNumberPackage where
  circle : Type u
  circleTopology : TopologicalSpace circle
  map : circle → circle
  mapContinuous : Prop
  lift : ℝ → ℝ
  liftContinuous : Prop
  liftMonotone : Prop
  rotationNumber : ℝ
  rotationNumberExists : Prop
  rotationNumberRational : Prop
  rotationNumberIrrational : Prop
  semiconjugacyExists : Prop
  semiconjugacy : circle → circle
  semiconjugacyContinuous : Prop

structure RotationNumberEvidence (R : RotationNumberPackage) where
  rotationNumberExistsClosed : R.rotationNumberExists
  rotationNumberRationalClosed : R.rotationNumberRational
  rotationNumberIrrationalClosed : R.rotationNumberIrrational
  semiconjugacyExistsClosed : R.semiconjugacyExists
  semiconjugacyContinuousClosed : R.semiconjugacyContinuous

def RotationNumberClosed (R : RotationNumberPackage) : Prop :=
  R.rotationNumberExists ∧ (R.rotationNumberRational ∨ R.rotationNumberIrrational) ∧
  R.semiconjugacyExists ∧ R.semiconjugacyContinuous

theorem rotation_number_closed_from_evidence (R : RotationNumberPackage)
    (E : RotationNumberEvidence R) : RotationNumberClosed R := by
  have r := E.rotationNumberRationalClosed; have ir := E.rotationNumberIrrationalClosed
  exact And.intro E.rotationNumberExistsClosed
    (And.intro (Or.inr r) (And.intro E.semiconjugacyExistsClosed E.semiconjugacyContinuousClosed))

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse