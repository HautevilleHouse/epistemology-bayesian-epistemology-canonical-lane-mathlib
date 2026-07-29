import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure BayesianAdmittedObject where
  priorProbability : Prop
  likelihoodFunction : Prop
  posteriorProbability : Prop
  coherenceConstraint : Prop
  conclusion : priorProbability → likelihoodFunction → posteriorProbability ∧ coherenceConstraint

structure AdmissibleClass where
  object : BayesianAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.posteriorProbability ∧ A.object.coherenceConstraint) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse