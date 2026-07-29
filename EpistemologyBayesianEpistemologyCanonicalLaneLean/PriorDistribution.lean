import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure PriorDistributionPackage where
  priorFamily : Type u
  hyperparameters : Type v
  density : priorFamily → hyperparameters → ℝ
  support : Set (priorFamily × hyperparameters)
  properPrior : Prop
  conjugateForm : Prop

structure PriorDistributionEvidence (P : PriorDistributionPackage) where
  properPriorClosed : P.properPrior
  conjugateFormClosed : P.conjugateForm

def PriorDistributionClosed (P : PriorDistributionPackage) : Prop :=
  P.properPrior ∧ P.conjugateForm

theorem prior_distribution_closed_from_evidence (P : PriorDistributionPackage)
    (E : PriorDistributionEvidence P) : PriorDistributionClosed P := by
  exact And.intro E.properPriorClosed E.conjugateFormClosed

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse
