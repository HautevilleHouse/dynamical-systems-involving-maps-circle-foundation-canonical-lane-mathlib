import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean.CircleMapDefinitions

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

structure TopologicalConjugacy (f g: CircleMap) where
  homeo: Homeomorph f.angle g.angle
  semiConj: ∀ x: f.angle, homeo (f.rotation x) = g.rotation (homeo x)

def conjugateCircleMaps (f g: CircleMap): Prop := Nonempty (TopologicalConjugacy f g)

theorem conjugacy_transitive (f g h: CircleMap) (h1: TopologicalConjugacy f g) (h2: TopologicalConjugacy g h):
    TopologicalConjugacy f h := by
  refine ⟨h1.homeo.trans h2.homeo, λ x => ?_⟩
  calc
    (h1.homeo.trans h2.homeo) (f.rotation x) = h2.homeo (h1.homeo (f.rotation x)) := rfl
    _ = h2.homeo (g.rotation (h1.homeo x)) := by rw [h1.semiConj x]
    _ = h.rotation (h2.homeo (h1.homeo x)) := by rw [h2.semiConj (h1.homeo x)]
    _ = h.rotation ((h1.homeo.trans h2.homeo) x) := rfl

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
