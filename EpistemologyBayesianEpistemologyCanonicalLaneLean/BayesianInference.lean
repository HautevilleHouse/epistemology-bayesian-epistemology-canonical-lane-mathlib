import EpistemologyBayesianEpistemologyCanonicalLaneLean.BayesianEvidence

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure BayesianInferencePackage {B : BayesianAdmissibleObject}
    {P : PriorDistributionPackage B} {L : LikelihoodFunctionPackage B}
    {U : PosteriorUpdatePackage P L} {E : BayesianEvidencePackage U} where
  posteriorFromEvidence : B.hypothesisSpace → ℝ
  inferenceConsistent : Prop
  inferenceComplete : Prop

structure BayesianInferenceEvidence {B : BayesianAdmissibleObject}
    {P : PriorDistributionPackage B} {L : LikelihoodFunctionPackage B}
    {U : PosteriorUpdatePackage P L} {E : BayesianEvidencePackage U}
    (I : BayesianInferencePackage P L U E) where
  inferenceConsistentClosed : I.inferenceConsistent
  inferenceCompleteClosed : I.inferenceComplete

def BayesianInferenceClosed {B : BayesianAdmissibleObject}
    {P : PriorDistributionPackage B} {L : LikelihoodFunctionPackage B}
    {U : PosteriorUpdatePackage P L} {E : BayesianEvidencePackage U}
    (I : BayesianInferencePackage P L U E) : Prop :=
  I.inferenceConsistent ∧ I.inferenceComplete

theorem bayesian_inference_closed_from_evidence
    {B : BayesianAdmissibleObject} {P : PriorDistributionPackage B}
    {L : LikelihoodFunctionPackage B} {U : PosteriorUpdatePackage P L}
    {E : BayesianEvidencePackage U} (I : BayesianInferencePackage P L U E)
    (Ev : BayesianInferenceEvidence I) : BayesianInferenceClosed I := by
  exact And.intro Ev.inferenceConsistentClosed Ev.inferenceCompleteClosed

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse