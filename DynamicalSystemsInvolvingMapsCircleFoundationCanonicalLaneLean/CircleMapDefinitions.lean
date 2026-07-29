import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

structure CircleMap where
  angle: Type u
  topology: TopologicalSpace angle
  rotation: angle → angle
  continuousRotation: Continuous rotation

def circleMapRotation (f: CircleMap): f.angle → f.angle := f.rotation

theorem circle_map_continuous (f: CircleMap): Continuous f.rotation := f.continuousRotation

structure AdmittedCircleObject where
  map: CircleMap
  rotationNumber: ℚ

def CircleWitnessClosed (O: AdmittedCircleObject): Prop :=
  O.rotationNumber = O.rotationNumber

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
