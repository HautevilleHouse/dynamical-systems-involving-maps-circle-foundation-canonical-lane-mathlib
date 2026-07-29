import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

/-!
# Circle Map Invariant Measures Package

This module records invariant measures for circle maps, including absolutely
continuous invariant measures, ergodicity, and mixing.
-/

structure InvariantMeasuresPackage where
  map : Type u
  borelMeasure : Type v
  invariantMeasureExists : Prop
  ergodicMeasure : Prop
  mixingMeasure : Prop
  absolutelyContinuousMeasure : Prop

structure InvariantMeasuresEvidence (I : InvariantMeasuresPackage) where
  invariantMeasureExistsClosed : I.invariantMeasureExists
  ergodicMeasureClosed : I.ergodicMeasure
  mixingMeasureClosed : I.mixingMeasure
  absolutelyContinuousMeasureClosed : I.absolutelyContinuousMeasure

def InvariantMeasuresClosed (I : InvariantMeasuresPackage) : Prop :=
  I.invariantMeasureExists ∧ I.ergodicMeasure ∧ I.mixingMeasure ∧ I.absolutelyContinuousMeasure

theorem invariant_measures_closed_from_evidence (I : InvariantMeasuresPackage) (E : InvariantMeasuresEvidence I) :
    InvariantMeasuresClosed I := by
  exact And.intro E.invariantMeasureExistsClosed
    (And.intro E.ergodicMeasureClosed
      (And.intro E.mixingMeasureClosed E.absolutelyContinuousMeasureClosed))

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
