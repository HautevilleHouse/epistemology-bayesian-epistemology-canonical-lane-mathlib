import EpistemologyBayesianEpistemologyCanonicalLaneLean.PriorDistributions
import EpistemologyBayesianEpistemologyCanonicalLaneLean.LikelihoodFunctions

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure PosteriorComputation (θ : Type) (data : Type) (P : PriorDistribution θ) (L : LikelihoodFunction θ data) where
  prior : P
  likelihood : L
  observedData : data
  posterior : θ → ℝ
  bayesRuleApplied : posterior = λ x => (P.pdf x * L.l x observedData) / (∫ y, P.pdf y * L.l y observedData)
  denominatorFinite : (∫ y, P.pdf y * L.l y observedData) > 0
  bayesRuleProof : bayesRuleApplied
  denominatorProof : denominatorFinite

structure PosteriorEvidence (θ : Type) (data : Type) (P : PriorDistribution θ) (L : LikelihoodFunction θ data) (C : PosteriorComputation θ data P L) where
  bayesRuleClosed : C.bayesRuleApplied
  denominatorClosed : C.denominatorFinite

def PosteriorClosed (θ : Type) (data : Type) (P : PriorDistribution θ) (L : LikelihoodFunction θ data) (C : PosteriorComputation θ data P L) : Prop :=
  C.bayesRuleApplied ∧ C.denominatorFinite

theorem posterior_closed_from_evidence (θ : Type) (data : Type) (P : PriorDistribution θ) (L : LikelihoodFunction θ data) (C : PosteriorComputation θ data P L) (E : PosteriorEvidence θ data P L C) : PosteriorClosed θ data P L C := by
  exact And.intro E.bayesRuleClosed E.denominatorClosed

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse