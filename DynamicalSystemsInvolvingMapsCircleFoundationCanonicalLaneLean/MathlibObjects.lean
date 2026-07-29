import DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

structure CircleSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure CircleAdmittedObject where
  space : CircleSpace
  circleStructure : Prop
  orientationPreservingMap : Prop
  degreeOne : Prop
  conclusion : degreeOne

def CircleWitnessClosed (O : CircleAdmittedObject) : Prop :=
  O.degreeOne

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
