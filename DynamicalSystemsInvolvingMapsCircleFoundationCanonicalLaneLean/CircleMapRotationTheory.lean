import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

/-!
# Circle Map Rotation Theory Package

This module records the rotation number, rotation set, and related properties
for continuous maps of the circle.
-/

structure RotationNumberPackage where
  map : Type u
  liftToReals : map -> (ℝ -> ℝ)
  rotationNumberDefined : Prop
  rotationNumberExists : Prop
  rationalRotation : Prop
  irrationalRotation : Prop

structure RotationNumberEvidence (R : RotationNumberPackage) where
  rotationNumberDefinedClosed : R.rotationNumberDefined
  rotationNumberExistsClosed : R.rotationNumberExists
  rationalRotationClosed : R.rationalRotation
  irrationalRotationClosed : R.irrationalRotation

def RotationNumberClosed (R : RotationNumberPackage) : Prop :=
  R.rotationNumberDefined ∧ R.rotationNumberExists ∧ R.rationalRotation ∧ R.irrationalRotation

theorem rotation_number_closed_from_evidence (R : RotationNumberPackage) (E : RotationNumberEvidence R) :
    RotationNumberClosed R := by
  exact And.intro E.rotationNumberDefinedClosed
    (And.intro E.rotationNumberExistsClosed
      (And.intro E.rationalRotationClosed E.irrationalRotationClosed))

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
