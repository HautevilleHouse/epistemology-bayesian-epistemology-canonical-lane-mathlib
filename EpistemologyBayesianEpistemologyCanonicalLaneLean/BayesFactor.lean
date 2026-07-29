import EpistemologyBayesianEpistemologyCanonicalLaneLean.BayesianInference

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure BayesFactorPackage {M : BayesianModel}
    (Inf : BayesianInferencePackage M) where
  modelComparisonDefined : Prop
  bayesFactorComputed : Prop
  modelAveragingPossible : Prop

structure BayesFactorEvidence {M : BayesianModel}
    {Inf : BayesianInferencePackage M} (P : BayesFactorPackage Inf) where
  modelComparisonDefinedClosed : P.modelComparisonDefined
  bayesFactorComputedClosed : P.bayesFactorComputed
  modelAveragingPossibleClosed : P.modelAveragingPossible

def BayesFactorClosed {M : BayesianModel}
    {Inf : BayesianInferencePackage M} (P : BayesFactorPackage Inf) : Prop :=
  P.modelComparisonDefined ∧ P.bayesFactorComputed ∧ P.modelAveragingPossible

theorem bayes_factor_closed_from_evidence
    {M : BayesianModel} {Inf : BayesianInferencePackage M}
    (P : BayesFactorPackage Inf)
    (E : BayesFactorEvidence P) : BayesFactorClosed P := by
  exact And.intro E.modelComparisonDefinedClosed
    (And.intro E.bayesFactorComputedClosed E.modelAveragingPossibleClosed)

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse