import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

/-!
# Circle Map Morse-Smale Package

This module records the Morse-Smale property for circle maps: hyperbolic periodic
points with transverse intersections and structural stability.
-/

structure MorseSmaleCircleMapPackage where
  periodicPoints : Type u
  hyperbolicPeriodicPoints : Prop
  transversalityCondition : Prop
  structuralStability : Prop
  noWanderingPoints : Prop

structure MorseSmaleCircleMapEvidence (M : MorseSmaleCircleMapPackage) where
  hyperbolicPeriodicPointsClosed : M.hyperbolicPeriodicPoints
  transversalityConditionClosed : M.transversalityCondition
  structuralStabilityClosed : M.structuralStability
  noWanderingPointsClosed : M.noWanderingPoints

def MorseSmaleCircleMapClosed (M : MorseSmaleCircleMapPackage) : Prop :=
  M.hyperbolicPeriodicPoints ∧ M.transversalityCondition ∧ M.structuralStability ∧ M.noWanderingPoints

theorem morse_smale_circle_map_closed_from_evidence (M : MorseSmaleCircleMapPackage) (E : MorseSmaleCircleMapEvidence M) :
    MorseSmaleCircleMapClosed M := by
  exact And.intro E.hyperbolicPeriodicPointsClosed
    (And.intro E.transversalityConditionClosed
      (And.intro E.structuralStabilityClosed E.noWanderingPointsClosed))

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
