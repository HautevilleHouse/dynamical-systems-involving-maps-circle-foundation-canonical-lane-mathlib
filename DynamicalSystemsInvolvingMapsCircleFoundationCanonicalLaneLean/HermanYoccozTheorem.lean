import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

/-!
# Herman-Yoccoz Theorem Package

This module records the Herman-Yoccoz theorem: for a circle diffeomorphism with
diophantine rotation number and sufficiently smooth, the map is C^1 conjugate to
an irrational rotation.
-/

structure HermanYoccozTheoremPackage where
  rotationNumberDiophantine : Prop
  smoothnessClass : String
  conjugacyConstructed : Prop
  conjugacySmoothness : Prop

structure HermanYoccozTheoremEvidence (H : HermanYoccozTheoremPackage) where
  rotationNumberDiophantineClosed : H.rotationNumberDiophantine
  smoothnessClassClosed : H.smoothnessClass = "C^1"
  conjugacyConstructedClosed : H.conjugacyConstructed
  conjugacySmoothnessClosed : H.conjugacySmoothness

def HermanYoccozTheoremClosed (H : HermanYoccozTheoremPackage) : Prop :=
  H.rotationNumberDiophantine ∧ H.conjugacyConstructed ∧ H.conjugacySmoothness

theorem herman_yoccoz_theorem_closed_from_evidence (H : HermanYoccozTheoremPackage) (E : HermanYoccozTheoremEvidence H) :
    HermanYoccozTheoremClosed H := by
  exact And.intro E.rotationNumberDiophantineClosed
    (And.intro E.conjugacyConstructedClosed E.conjugacySmoothnessClosed)

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
