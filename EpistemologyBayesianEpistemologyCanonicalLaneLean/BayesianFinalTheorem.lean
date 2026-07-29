import EpistemologyBayesianEpistemologyCanonicalLaneLean.BayesianGateLemmas

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

def ConstrainedBayesianEpistemologyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bayesian_epistemology_endgame (A : AdmissibleClass) :
    ConstrainedBayesianEpistemologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse