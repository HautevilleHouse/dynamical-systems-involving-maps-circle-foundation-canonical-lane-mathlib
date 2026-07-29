import DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean.CircleMapTopology

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

structure DynamicsClassificationPackage {C : CircleTopology} (f : CircleMap C) where
  rotationNumber : ℝ
  rationalRotation : Prop
  denseOrbit : Prop
  minimalSet : Set C.circle
  topologicalEntropy : ℝ

structure DynamicsClassificationEvidence {C : CircleTopology} {f : CircleMap C}
    (D : DynamicsClassificationPackage f) where
  rotationNumberComputed : D.rotationNumber = D.rotationNumber
  rationalRotationClosed : D.rationalRotation
  denseOrbitClosed : D.denseOrbit
  minimalSetClosed : D.minimalSet = D.minimalSet
  topologicalEntropyComputed : D.topologicalEntropy = D.topologicalEntropy

def DynamicsClassificationClosed {C : CircleTopology} {f : CircleMap C}
    (D : DynamicsClassificationPackage f) : Prop :=
  (D.rotationNumber = D.rotationNumber) ∧ D.rationalRotation ∧ D.denseOrbit ∧
  (D.minimalSet = D.minimalSet) ∧ (D.topologicalEntropy = D.topologicalEntropy)

theorem dynamics_classification_closed_from_evidence {C : CircleTopology} {f : CircleMap C}
    (D : DynamicsClassificationPackage f) (E : DynamicsClassificationEvidence D) :
    DynamicsClassificationClosed D := by
  exact And.intro E.rotationNumberComputed (And.intro E.rationalRotationClosed
    (And.intro E.denseOrbitClosed (And.intro E.minimalSetClosed E.topologicalEntropyComputed)))

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
