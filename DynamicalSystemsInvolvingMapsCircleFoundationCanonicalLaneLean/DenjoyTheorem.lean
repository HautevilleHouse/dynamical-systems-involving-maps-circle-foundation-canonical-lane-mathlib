import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

structure DenjoyPackage where
  circle : Type u
  circleTopology : TopologicalSpace circle
  map : circle → circle
  mapOrientationPreserving : Prop
  mapDiffClass : ℕ
  rotationNumberIrrational : Prop
  minimalSetIsCircle : Prop
  transitive : Prop
  topologicallyConjugateToRotation : Prop
  conjugationHomeomorphism : circle → circle
  conjugationHomeomorphismContinuous : Prop

structure DenjoyEvidence (D : DenjoyPackage) where
  mapOrientationPreservingClosed : D.mapOrientationPreserving
  rotationNumberIrrationalClosed : D.rotationNumberIrrational
  minimalSetIsCircleClosed : D.minimalSetIsCircle
  transitiveClosed : D.transitive
  topologicallyConjugateToRotationClosed : D.topologicallyConjugateToRotation
  conjugationHomeomorphismContinuousClosed : D.conjugationHomeomorphismContinuous

def DenjoyClosed (D : DenjoyPackage) : Prop :=
  D.mapOrientationPreserving ∧ D.rotationNumberIrrational ∧ D.minimalSetIsCircle ∧
  D.transitive ∧ D.topologicallyConjugateToRotation ∧ D.conjugationHomeomorphismContinuous

theorem denjoy_closed_from_evidence (D : DenjoyPackage) (E : DenjoyEvidence D) :
    DenjoyClosed D := by
  exact And.intro E.mapOrientationPreservingClosed
    (And.intro E.rotationNumberIrrationalClosed
      (And.intro E.minimalSetIsCircleClosed
        (And.intro E.transitiveClosed
          (And.intro E.topologicallyConjugateToRotationClosed
            E.conjugationHomeomorphismContinuousClosed))))

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse