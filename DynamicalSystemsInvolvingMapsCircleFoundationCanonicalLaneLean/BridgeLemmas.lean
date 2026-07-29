import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean.CircleMapDefinitions

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

def bridgeClosed (A: AdmissibleClass) : Prop :=
  CircleWitnessClosed A.object

theorem bridge_from_admissible_class (A: AdmissibleClass): bridgeClosed A := by
  exact A.object.conclusion

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
