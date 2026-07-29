import HautevilleHouse.EpistemologyBayesianEpistemologyCanonicalLaneLean.PriorPackage

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure LikelihoodPackage (P : PriorPackage) where
  samplingModel : Type u
  identifiability : Prop
  exchangeability : Prop
  compatibilityWithPrior : Prop

structure LikelihoodEvidence {P : PriorPackage} (L : LikelihoodPackage P) where
  identifiabilityClosed : L.identifiability
  exchangeabilityClosed : L.exchangeability
  compatibilityWithPriorClosed : L.compatibilityWithPrior

def LikelihoodClosed {P : PriorPackage} (L : LikelihoodPackage P) : Prop :=
  L.identifiability ∧ L.exchangeability ∧ L.compatibilityWithPrior

theorem likelihood_closed_from_evidence {P : PriorPackage} (L : LikelihoodPackage P) (E : LikelihoodEvidence L) : LikelihoodClosed L :=
  And.intro E.identifiabilityClosed (And.intro E.exchangeabilityClosed E.compatibilityWithPriorClosed)

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse