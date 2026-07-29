import EpistemologyBayesianEpistemologyCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure AdmissibleClass where
  object : BayesianAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BayesianWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse