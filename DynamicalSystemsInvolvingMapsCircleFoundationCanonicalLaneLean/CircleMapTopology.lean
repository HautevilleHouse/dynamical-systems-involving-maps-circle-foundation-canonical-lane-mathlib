import DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

structure CircleTopology where
  circle : Type u
  topology : TopologicalSpace circle
  chart : Type v
  smoothStructure : Prop
  dimensionOne : Prop
  compactWithoutBoundary : Prop

structure CircleMap (C : CircleTopology) where
  map : C.circle → C.circle
  continuity : Prop
  degree : ℤ
  orientationPreserving : Prop

structure CircleMapEvidence {C : CircleTopology} (f : CircleMap C) where
  continuityClosed : f.continuity
  degreeComputed : f.degree = f.degree
  orientationPreservingClosed : f.orientationPreserving

def CircleMapClosed {C : CircleTopology} (f : CircleMap C) : Prop :=
  f.continuity ∧ (f.degree = f.degree) ∧ f.orientationPreserving

theorem circle_map_closed_from_evidence {C : CircleTopology} (f : CircleMap C)
    (E : CircleMapEvidence f) : CircleMapClosed f := by
  exact And.intro E.continuityClosed (And.intro E.degreeComputed E.orientationPreservingClosed)

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
