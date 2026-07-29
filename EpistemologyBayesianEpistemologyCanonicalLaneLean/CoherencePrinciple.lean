import HautevilleHouse.EpistemologyBayesianEpistemologyCanonicalLaneLean.BayesianUpdate

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure CoherencePrinciplePackage {P : PriorDistributionPackage} (U : BayesianUpdatePackage P) where
  dynamicCoherence : Prop
  conditionalCoherence : Prop
  conjugateClosure : Prop
  evidenceAccumulation : Prop

structure CoherencePrincipleEvidence {P : PriorDistributionPackage} {U : BayesianUpdatePackage P} (C : CoherencePrinciplePackage U) where
  dynamicCoherenceClosed : C.dynamicCoherence
  conditionalCoherenceClosed : C.conditionalCoherence
  conjugateClosureClosed : C.conjugateClosure
  evidenceAccumulationClosed : C.evidenceAccumulation

def CoherencePrincipleClosed {P : PriorDistributionPackage} {U : BayesianUpdatePackage P} (C : CoherencePrinciplePackage U) : Prop :=
  C.dynamicCoherence ∧ C.conditionalCoherence ∧ C.conjugateClosure ∧ C.evidenceAccumulation

theorem coherence_principle_closed_from_evidence
    {P : PriorDistributionPackage} {U : BayesianUpdatePackage P}
    (C : CoherencePrinciplePackage U) (E : CoherencePrincipleEvidence C) :
    CoherencePrincipleClosed C := by
  exact And.intro E.dynamicCoherenceClosed
    (And.intro E.conditionalCoherenceClosed
      (And.intro E.conjugateClosureClosed E.evidenceAccumulationClosed))

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse