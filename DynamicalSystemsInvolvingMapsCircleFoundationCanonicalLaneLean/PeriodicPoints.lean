import DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean.DynamicsClassification

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

structure PeriodicPointsPackage {C : CircleTopology} {f : CircleMap C}
    (D : DynamicsClassificationPackage f) where
  periodicPointSet : Set ℕ × Set C.circle
  periodDividesRotation : Prop
  primePeriodCount : ℕ
  periodicPointsDense : Prop

structure PeriodicPointsEvidence {C : CircleTopology} {f : CircleMap C}
    {D : DynamicsClassificationPackage f} (P : PeriodicPointsPackage D) where
  periodicPointSetClosed : P.periodicPointSet = P.periodicPointSet
  periodDividesRotationClosed : P.periodDividesRotation
  primePeriodCountClosed : P.primePeriodCount = P.primePeriodCount
  periodicPointsDenseClosed : P.periodicPointsDense

def PeriodicPointsClosed {C : CircleTopology} {f : CircleMap C}
    {D : DynamicsClassificationPackage f} (P : PeriodicPointsPackage D) : Prop :=
  (P.periodicPointSet = P.periodicPointSet) ∧ P.periodDividesRotation ∧
  (P.primePeriodCount = P.primePeriodCount) ∧ P.periodicPointsDense

theorem periodic_points_closed_from_evidence {C : CircleTopology} {f : CircleMap C}
    {D : DynamicsClassificationPackage f} (P : PeriodicPointsPackage D)
    (E : PeriodicPointsEvidence P) : PeriodicPointsClosed P := by
  exact And.intro E.periodicPointSetClosed (And.intro E.periodDividesRotationClosed
    (And.intro E.primePeriodCountClosed E.periodicPointsDenseClosed))

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
