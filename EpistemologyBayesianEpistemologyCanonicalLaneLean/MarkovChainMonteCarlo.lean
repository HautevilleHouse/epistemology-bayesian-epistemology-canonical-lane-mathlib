import EpistemologyBayesianEpistemologyCanonicalLaneLean.BayesianInference

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure MarkovChainMonteCarloPackage {M : BayesianModel}
    (Inf : BayesianInferencePackage M) where
  chainConstructed : Prop
  stationaryDistributionAchieved : Prop
  ergodicAverageConverges : Prop

structure MarkovChainMonteCarloEvidence {M : BayesianModel}
    {Inf : BayesianInferencePackage M} (P : MarkovChainMonteCarloPackage Inf) where
  chainConstructedClosed : P.chainConstructed
  stationaryDistributionAchievedClosed : P.stationaryDistributionAchieved
  ergodicAverageConvergesClosed : P.ergodicAverageConverges

def MarkovChainMonteCarloClosed {M : BayesianModel}
    {Inf : BayesianInferencePackage M} (P : MarkovChainMonteCarloPackage Inf) : Prop :=
  P.chainConstructed ∧ P.stationaryDistributionAchieved ∧ P.ergodicAverageConverges

theorem markov_chain_monte_carlo_closed_from_evidence
    {M : BayesianModel} {Inf : BayesianInferencePackage M}
    (P : MarkovChainMonteCarloPackage Inf)
    (E : MarkovChainMonteCarloEvidence P) : MarkovChainMonteCarloClosed P := by
  exact And.intro E.chainConstructedClosed
    (And.intro E.stationaryDistributionAchievedClosed E.ergodicAverageConvergesClosed)

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse