import HautevilleHouse.EpistemologyBayesianEpistemologyCanonicalLaneLean.AdmissibleClassBayesian

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.posteriorProbability ∧ A.object.coherenceConstraint

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  have h : A.object.posteriorProbability ∧ A.object.coherenceConstraint := A.object.conclusion A.object.priorProbability A.object.likelihoodFunction
  exact h

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse