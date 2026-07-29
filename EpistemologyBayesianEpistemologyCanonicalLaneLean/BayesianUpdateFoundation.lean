import HautevilleHouse.EpistemologyBayesianEpistemologyCanonicalLaneLean.PosteriorPackage
import HautevilleHouse.EpistemologyBayesianEpistemologyCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure BayesianUpdateFoundation where
  prior : PriorPackage
  priorEvidence : PriorEvidence prior
  likelihood : LikelihoodPackage prior
  likelihoodEvidence : LikelihoodEvidence likelihood
  posterior : PosteriorPackage prior likelihood
  posteriorEvidence : PosteriorEvidence posterior

def BayesianUpdateFoundationClosed (B : BayesianUpdateFoundation) : Prop :=
  PriorClosed B.prior ∧ LikelihoodClosed B.likelihood ∧ PosteriorClosed B.posterior

theorem bayesian_update_foundation_closed_from_evidence (B : BayesianUpdateFoundation) : BayesianUpdateFoundationClosed B := by
  exact And.intro (prior_closed_from_evidence B.prior B.priorEvidence)
    (And.intro (likelihood_closed_from_evidence B.likelihood B.likelihoodEvidence)
      (posterior_closed_from_evidence B.posterior B.posteriorEvidence))

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse