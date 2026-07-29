import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BayesianModel where
  parameterSpace : Type
  observationSpace : Type
  prior : parameterSpace → ℝ
  likelihood : parameterSpace → observationSpace → ℝ
  posterior : parameterSpace → ℝ

structure BayesianAdmittedObject where
  model : BayesianModel
  priorProper : Prop
  likelihoodWellDefined : Prop
  posteriorComputed : Prop
  conclusion : priorProper ∧ likelihoodWellDefined ∧ posteriorComputed

structure BayesianEndgameState where
  object : BayesianAdmittedObject

def BayesianWitnessClosed (O : BayesianAdmittedObject) : Prop :=
  O.conclusion

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse