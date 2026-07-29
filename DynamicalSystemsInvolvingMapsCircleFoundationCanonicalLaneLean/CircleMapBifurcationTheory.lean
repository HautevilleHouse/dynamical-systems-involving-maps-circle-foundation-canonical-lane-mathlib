import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

/-!
# Circle Map Bifurcation Theory Package

This module records bifurcation phenomena in families of circle maps, such as
saddle-node bifurcations, period doubling, and Arnold tongues.
-/

structure BifurcationTheoryPackage where
  familyParameter : Type u
  bifurcationTypes : List String
  arnoldTongueLocations : Prop
  saddleNodeBifurcation : Prop
  periodDoublingBifurcation : Prop

structure BifurcationTheoryEvidence (B : BifurcationTheoryPackage) where
  arnoldTongueLocationsClosed : B.arnoldTongueLocations
  saddleNodeBifurcationClosed : B.saddleNodeBifurcation
  periodDoublingBifurcationClosed : B.periodDoublingBifurcation

def BifurcationTheoryClosed (B : BifurcationTheoryPackage) : Prop :=
  B.arnoldTongueLocations ∧ B.saddleNodeBifurcation ∧ B.periodDoublingBifurcation

theorem bifurcation_theory_closed_from_evidence (B : BifurcationTheoryPackage) (E : BifurcationTheoryEvidence B) :
    BifurcationTheoryClosed B := by
  exact And.intro E.arnoldTongueLocationsClosed
    (And.intro E.saddleNodeBifurcationClosed E.periodDoublingBifurcationClosed)

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
