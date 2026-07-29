import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

structure CircleMapDynamicsPackage where
  circle : Type u
  circleTopology : TopologicalSpace circle
  map : circle → circle
  mapContinuous : Prop
  topologicalDegree : ℤ
  degreeComputed : Prop
  liftToReal : circle → ℝ
  liftContinuous : Prop
  rotationNumber : ℝ
  rotationNumberDefined : Prop
  periodicPoints : Set circle
  periodicPointsStructure : Prop
  minimalSet : Set circle
  minimalSetExists : Prop
  transitive : Prop
  mixing : Prop

structure CircleMapDynamicsEvidence (P : CircleMapDynamicsPackage) where
  mapContinuousClosed : P.mapContinuous
  degreeComputedClosed : P.degreeComputed
  rotationNumberDefinedClosed : P.rotationNumberDefined
  periodicPointsStructureClosed : P.periodicPointsStructure
  minimalSetExistsClosed : P.minimalSetExists
  transitiveClosed : P.transitive
  mixingClosed : P.mixing

def CircleMapDynamicsClosed (P : CircleMapDynamicsPackage) : Prop :=
  P.mapContinuous ∧ P.degreeComputed ∧ P.rotationNumberDefined ∧
  P.periodicPointsStructure ∧ P.minimalSetExists ∧ P.transitive ∧ P.mixing

theorem circle_map_dynamics_closed_from_evidence (P : CircleMapDynamicsPackage)
    (E : CircleMapDynamicsEvidence P) : CircleMapDynamicsClosed P := by
  exact And.intro E.mapContinuousClosed
    (And.intro E.degreeComputedClosed
      (And.intro E.rotationNumberDefinedClosed
        (And.intro E.periodicPointsStructureClosed
          (And.intro E.minimalSetExistsClosed
            (And.intro E.transitiveClosed E.mixingClosed)))))

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse