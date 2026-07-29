import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure BayesianExperiment where
  parameterSpace : Type
  prior : parameterSpace → ℝ
  likelihood : parameterSpace → ℝ
  data : ℝ

structure BayesianAdmittedObject where
  experiment : BayesianExperiment
  posteriorComputed : Prop
  conclusion : posteriorComputed

def BayesianWitnessClosed (O : BayesianAdmittedObject) : Prop :=
  O.posteriorComputed

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse