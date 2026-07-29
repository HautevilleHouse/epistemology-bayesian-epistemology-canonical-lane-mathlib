import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure PosteriorInferencePackage where
  prior : PriorDistributionPackage
  likelihood : LikelihoodFunctionPackage
  posteriorFamily : Type u
  posteriorDensity : posteriorFamily → ℝ
  consistencyProp : Prop
  asymptoticNormality : Prop
  mcmcConvergence : Prop

structure PosteriorInferenceEvidence (P : PosteriorInferencePackage) where
  consistencyClosed : P.consistencyProp
  asymptoticNormalityClosed : P.asymptoticNormality
  mcmcConvergenceClosed : P.mcmcConvergence

def PosteriorInferenceClosed (P : PosteriorInferencePackage) : Prop :=
  P.consistencyProp ∧ P.asymptoticNormality ∧ P.mcmcConvergence

theorem posterior_inference_closed_from_evidence (P : PosteriorInferencePackage)
    (E : PosteriorInferenceEvidence P) : PosteriorInferenceClosed P := by
  exact And.intro E.consistencyClosed
    (And.intro E.asymptoticNormalityClosed E.mcmcConvergenceClosed)

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse
