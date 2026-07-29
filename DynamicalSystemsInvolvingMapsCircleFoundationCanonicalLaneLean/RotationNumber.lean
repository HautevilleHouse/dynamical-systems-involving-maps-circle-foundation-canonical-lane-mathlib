import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean.CircleMapDefinitions

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

structure RotationNumberData (f: CircleMap) where
  lift: ℝ → ℝ
  liftMonotone: Monotone lift
  liftCircled: ∀ x: ℝ, lift (x + 1) = lift x + 1
  rho: ℝ
  limitExists: ∀ x: ℝ, Filter.Tendsto (λ n: ℕ => (lift^[n] x - x) / (n : ℝ)) Filter.atTop (nhds rho)

def rotationNumber (ρ: RotationNumberData f): ℝ := ρ.rho

theorem rotation_number_limit (f: CircleMap) (ρ: RotationNumberData f) (x: ℝ):
    Filter.Tendsto (λ n: ℕ => (ρ.lift^[n] x - x) / (n : ℝ)) Filter.atTop (nhds ρ.rho) := ρ.limitExists x

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
