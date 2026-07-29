import DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean.PeriodicPoints

namespace HautevilleHouse
namespace DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean

structure SemiConjugacyPackage {C : CircleTopology} {f : CircleMap C}
    {D : DynamicsClassificationPackage f} {P : PeriodicPointsPackage D} where
  targetCircle : CircleTopology
  targetMap : CircleMap targetCircle
  semiConjugacy : C.circle → targetCircle.circle
  degreeRelation : ℤ
  liftingProperty : Prop

structure SemiConjugacyEvidence {C : CircleTopology} {f : CircleMap C}
    {D : DynamicsClassificationPackage f} {P : PeriodicPointsPackage D}
    (S : SemiConjugacyPackage P) where
  semiConjugacyContinuous : Continuous S.semiConjugacy
  mapEquiv : S.semiConjugacy ∘ f.map = targetMap.map ∘ S.semiConjugacy
  degreeRelationClosed : S.degreeRelation = S.degreeRelation
  liftingPropertyClosed : S.liftingProperty

def SemiConjugacyClosed {C : CircleTopology} {f : CircleMap C}
    {D : DynamicsClassificationPackage f} {P : PeriodicPointsPackage D}
    (S : SemiConjugacyPackage P) : Prop :=
  (∀ x : C.circle, S.semiConjugacy (f.map x) = S.targetMap.map (S.semiConjugacy x)) ∧
  (S.degreeRelation = S.degreeRelation) ∧ S.liftingProperty

theorem semi_conjugacy_closed_from_evidence {C : CircleTopology} {f : CircleMap C}
    {D : DynamicsClassificationPackage f} {P : PeriodicPointsPackage D}
    (S : SemiConjugacyPackage P) (E : SemiConjugacyEvidence S) :
    SemiConjugacyClosed S := by
  have h : ∀ x : C.circle, S.semiConjugacy (f.map x) = S.targetMap.map (S.semiConjugacy x) := by
    intro x; calc
      S.semiConjugacy (f.map x) = (S.semiConjugacy ∘ f.map) x := rfl
      _ = (S.targetMap.map ∘ S.semiConjugacy) x := by rw [E.mapEquiv]
      _ = S.targetMap.map (S.semiConjugacy x) := rfl
  exact And.intro h (And.intro E.degreeRelationClosed E.liftingPropertyClosed)

end DynamicalSystemsInvolvingMapsCircleFoundationCanonicalLaneLean
end HautevilleHouse
