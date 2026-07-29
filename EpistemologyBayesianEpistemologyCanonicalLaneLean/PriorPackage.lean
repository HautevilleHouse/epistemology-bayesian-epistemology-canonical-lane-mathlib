import HautevilleHouse.EpistemologyBayesianEpistemologyCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure PriorPackage where
  priorDistribution : Type u
  priorSupport : Prop
  properPrior : Prop
  coherenceWithAxioms : Prop

structure PriorEvidence (P : PriorPackage) where
  priorSupportClosed : P.priorSupport
  properPriorClosed : P.properPrior
  coherenceWithAxiomsClosed : P.coherenceWithAxioms

def PriorClosed (P : PriorPackage) : Prop :=
  P.priorSupport ∧ P.properPrior ∧ P.coherenceWithAxioms

theorem prior_closed_from_evidence (P : PriorPackage) (E : PriorEvidence P) : PriorClosed P :=
  And.intro E.priorSupportClosed (And.intro E.properPriorClosed E.coherenceWithAxiomsClosed)

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse