import EpistemologyBayesianEpistemologyCanonicalLaneLean.PriorDistribution
import EpistemologyBayesianEpistemologyCanonicalLaneLean.LikelihoodFunction

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure PosteriorUpdatePackage {B : BayesianAdmissibleObject}
    (P : PriorDistributionPackage B) (L : LikelihoodFunctionPackage B) where
  posteriorFunction : B.hypothesisSpace → ℝ
  bayesRuleApplied : Prop
  posteriorNormalized : Prop

structure PosteriorUpdateEvidence {B : BayesianAdmissibleObject}
    {P : PriorDistributionPackage B} {L : LikelihoodFunctionPackage B}
    (U : PosteriorUpdatePackage P L) where
  bayesRuleAppliedClosed : U.bayesRuleApplied
  posteriorNormalizedClosed : U.posteriorNormalized

def PosteriorUpdateClosed {B : BayesianAdmissibleObject}
    {P : PriorDistributionPackage B} {L : LikelihoodFunctionPackage B}
    (U : PosteriorUpdatePackage P L) : Prop :=
  U.bayesRuleApplied ∧ U.posteriorNormalized

theorem posterior_update_closed_from_evidence
    {B : BayesianAdmissibleObject} {P : PriorDistributionPackage B}
    {L : LikelihoodFunctionPackage B} (U : PosteriorUpdatePackage P L)
    (E : PosteriorUpdateEvidence U) : PosteriorUpdateClosed U := by
  exact And.intro E.bayesRuleAppliedClosed E.posteriorNormalizedClosed

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse