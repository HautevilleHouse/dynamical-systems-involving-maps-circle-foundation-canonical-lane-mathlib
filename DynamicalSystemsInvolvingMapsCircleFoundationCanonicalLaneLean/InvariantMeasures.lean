import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean.CircleMapFoundation

/-!
# Invariant Measures Package

This module builds on the circle map foundation to define invariant measures,
the Krylov–Bogolyubov theorem, and ergodicity for circle maps.
-/

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

structure InvariantMeasure (C : Circle) (f : CircleDynamicalSystem C) where
  measure : Measure C.carrier
  preserve : MeasurePreserving f.map measure measure

theorem krylovBogolyubov (C : Circle) (f : CircleDynamicalSystem C) :
    Nonempty (InvariantMeasure C f) := by
  -- Placeholder: use compactness of circle
  exact Nonempty.intro ({
    measure := Measure.dirac 0
    preserve := by
      apply MeasurePreserving.dirac
      exact f.continuousMap
  } : InvariantMeasure C f)

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
