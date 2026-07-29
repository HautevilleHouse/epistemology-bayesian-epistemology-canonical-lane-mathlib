import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure LikelihoodFunctionPackage where
  observationModel : Type u
  parameterSpace : Type v
  likelihood : observationModel → parameterSpace → ℝ
  identifiability : Prop
  exchangeability : Prop
  stableUnderSampling : Prop

structure LikelihoodFunctionEvidence (L : LikelihoodFunctionPackage) where
  identifiabilityClosed : L.identifiability
  exchangeabilityClosed : L.exchangeability
  stableUnderSamplingClosed : L.stableUnderSampling

def LikelihoodFunctionClosed (L : LikelihoodFunctionPackage) : Prop :=
  L.identifiability ∧ L.exchangeability ∧ L.stableUnderSampling

theorem likelihood_function_closed_from_evidence (L : LikelihoodFunctionPackage)
    (E : LikelihoodFunctionEvidence L) : LikelihoodFunctionClosed L := by
  exact And.intro E.identifiabilityClosed
    (And.intro E.exchangeabilityClosed E.stableUnderSamplingClosed)

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse
