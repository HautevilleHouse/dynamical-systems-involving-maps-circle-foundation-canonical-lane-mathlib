import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

structure HermanRingPackage where
  circle : Type u
  circleTopology : TopologicalSpace circle
  map : circle → circle
  mapAnalytic : Prop
  rotationNumber : ℝ
  rotationNumberDiophantine : Prop
  hermanRingExists : Prop
  hermanRingDomain : Set ℂ
  hermanRingConjugacy : circle → circle
  hermanRingConjugacyAnalytic : Prop
  arnoldTongue : Set ℝ
  arnoldTongueDefined : Prop
  frequencyLocking : Prop

structure HermanRingEvidence (H : HermanRingPackage) where
  mapAnalyticClosed : H.mapAnalytic
  rotationNumberDiophantineClosed : H.rotationNumberDiophantine
  hermanRingExistsClosed : H.hermanRingExists
  hermanRingConjugacyAnalyticClosed : H.hermanRingConjugacyAnalytic
  arnoldTongueDefinedClosed : H.arnoldTongueDefined
  frequencyLockingClosed : H.frequencyLocking

def HermanRingClosed (H : HermanRingPackage) : Prop :=
  H.mapAnalytic ∧ H.rotationNumberDiophantine ∧ H.hermanRingExists ∧
  H.hermanRingConjugacyAnalytic ∧ H.arnoldTongueDefined ∧ H.frequencyLocking

theorem herman_ring_closed_from_evidence (H : HermanRingPackage)
    (E : HermanRingEvidence H) : HermanRingClosed H := by
  exact And.intro E.mapAnalyticClosed
    (And.intro E.rotationNumberDiophantineClosed
      (And.intro E.hermanRingExistsClosed
        (And.intro E.hermanRingConjugacyAnalyticClosed
          (And.intro E.arnoldTongueDefinedClosed E.frequencyLockingClosed))))

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse