import HautevilleHouse.EpistemologyBayesianEpistemologyCanonicalLaneLean.PriorDistribution

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure BayesianUpdatePackage (P : PriorDistributionPackage) where
  likelihoodFunction : P.probabilitySpace → ℝ
  posteriorMeasure : P.probabilitySpace → ℝ
  bayesTheorem : Prop
  posteriorConsistency : Prop
  sequentialUpdateValid : Prop

structure BayesianUpdateEvidence {P : PriorDistributionPackage} (U : BayesianUpdatePackage P) where
  bayesTheoremClosed : U.bayesTheorem
  posteriorConsistencyClosed : U.posteriorConsistency
  sequentialUpdateValidClosed : U.sequentialUpdateValid

def BayesianUpdateClosed {P : PriorDistributionPackage} (U : BayesianUpdatePackage P) : Prop :=
  U.bayesTheorem ∧ U.posteriorConsistency ∧ U.sequentialUpdateValid

theorem bayesian_update_closed_from_evidence
    {P : PriorDistributionPackage} (U : BayesianUpdatePackage P) (E : BayesianUpdateEvidence U) :
    BayesianUpdateClosed U := by
  exact And.intro E.bayesTheoremClosed (And.intro E.posteriorConsistencyClosed E.sequentialUpdateValidClosed)

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse