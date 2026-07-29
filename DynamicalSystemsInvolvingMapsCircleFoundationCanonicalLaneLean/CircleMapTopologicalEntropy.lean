import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

/-!
# Circle Map Topological Entropy Package

This module records topological entropy for circle maps, including computation
methods and relations to rotation number and Lyapunov exponents.
-/

structure TopologicalEntropyPackage where
  map : Type u
  topologicalEntropyValue : ℝ
  entropyComputed : Prop
  entropyNonnegative : Prop
  entropyRelationToRotation : Prop

structure TopologicalEntropyEvidence (T : TopologicalEntropyPackage) where
  entropyComputedClosed : T.entropyComputed
  entropyNonnegativeClosed : T.entropyNonnegative
  entropyRelationToRotationClosed : T.entropyRelationToRotation

def TopologicalEntropyClosed (T : TopologicalEntropyPackage) : Prop :=
  T.entropyComputed ∧ T.entropyNonnegative ∧ T.entropyRelationToRotation

theorem topological_entropy_closed_from_evidence (T : TopologicalEntropyPackage) (E : TopologicalEntropyEvidence T) :
    TopologicalEntropyClosed T := by
  exact And.intro E.entropyComputedClosed
    (And.intro E.entropyNonnegativeClosed E.entropyRelationToRotationClosed)

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
