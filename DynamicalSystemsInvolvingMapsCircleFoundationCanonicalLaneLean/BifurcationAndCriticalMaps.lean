import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

structure BifurcationPackage where
  circle : Type u
  circleTopology : TopologicalSpace circle
  mapFamily : ℝ → circle → circle
  mapFamilyContinuous : Prop
  parameter : ℝ
  criticalPointSet : Set circle
  criticalPointSetFinite : Prop
  mapCritical : Prop
  bifurcationValue : ℝ
  bifurcationDetected : Prop
  saddleNodeBifurcation : Prop
  periodDoublingBifurcation : Prop
  homoclinicBifurcation : Prop
  renormalizationExists : Prop
  renormalizationMap : circle → circle
  renormalizationContinuous : Prop

structure BifurcationEvidence (B : BifurcationPackage) where
  mapFamilyContinuousClosed : B.mapFamilyContinuous
  criticalPointSetFiniteClosed : B.criticalPointSetFinite
  bifurcationDetectedClosed : B.bifurcationDetected
  saddleNodeBifurcationClosed : B.saddleNodeBifurcation
  periodDoublingBifurcationClosed : B.periodDoublingBifurcation
  homoclinicBifurcationClosed : B.homoclinicBifurcation
  renormalizationExistsClosed : B.renormalizationExists
  renormalizationContinuousClosed : B.renormalizationContinuous

def BifurcationClosed (B : BifurcationPackage) : Prop :=
  B.mapFamilyContinuous ∧ B.criticalPointSetFinite ∧ B.bifurcationDetected ∧
  (B.saddleNodeBifurcation ∨ B.periodDoublingBifurcation ∨ B.homoclinicBifurcation) ∧
  B.renormalizationExists ∧ B.renormalizationContinuous

theorem bifurcation_closed_from_evidence (B : BifurcationPackage)
    (E : BifurcationEvidence B) : BifurcationClosed B := by
  exact And.intro E.mapFamilyContinuousClosed
    (And.intro E.criticalPointSetFiniteClosed
      (And.intro E.bifurcationDetectedClosed
        (And.intro (Or.inl E.saddleNodeBifurcationClosed)
          (And.intro E.renormalizationExistsClosed E.renormalizationContinuousClosed))))

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse