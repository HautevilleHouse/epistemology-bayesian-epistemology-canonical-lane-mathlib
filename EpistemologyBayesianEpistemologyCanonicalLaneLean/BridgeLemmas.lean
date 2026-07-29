import EpistemologyBayesianEpistemologyCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BayesianWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse