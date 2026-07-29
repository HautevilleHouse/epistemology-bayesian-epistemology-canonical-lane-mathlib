import EpistemologyBayesianEpistemologyCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure PriorDistribution (θ : Type) where
  pdf : θ → ℝ
  integrateToOne : Prop
  positivity : ∀ x : θ, pdf x ≥ 0
  integrateToOneProof : integrateToOne

structure PriorEvidence (θ : Type) (P : PriorDistribution θ) where
  integrateToOneClosed : P.integrateToOne
  positivityClosed : ∀ x : θ, P.pdf x ≥ 0

def PriorClosed (θ : Type) (P : PriorDistribution θ) : Prop :=
  P.integrateToOne ∧ (∀ x : θ, P.pdf x ≥ 0)

theorem prior_closed_from_evidence (θ : Type) (P : PriorDistribution θ) (E : PriorEvidence θ P) : PriorClosed θ P := by
  exact And.intro E.integrateToOneClosed E.positivityClosed

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse