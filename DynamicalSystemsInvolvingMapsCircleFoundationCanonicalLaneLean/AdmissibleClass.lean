import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean.CircleMapDefinitions

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

structure AdmissibleClass where
  object: AdmittedCircleObject
  endpointSatisfied: Prop
  remainderRecorded: Prop
  gateWitness: endpointSatisfied ∨ remainderRecorded

def admittedClosure (A: AdmissibleClass) : Prop :=
  CircleWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
