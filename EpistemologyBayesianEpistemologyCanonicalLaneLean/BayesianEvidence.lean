import EpistemologyBayesianEpistemologyCanonicalLaneLean.PosteriorUpdate

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure BayesianEvidencePackage {B : BayesianAdmissibleObject}
    {P : PriorDistributionPackage B} {L : LikelihoodFunctionPackage B}
    (U : PosteriorUpdatePackage P L) where
  evidenceValue : ℝ
  evidenceComputed : Prop
  evidencePositive : Prop

structure BayesianEvidenceEvidence {B : BayesianAdmissibleObject}
    {P : PriorDistributionPackage B} {L : LikelihoodFunctionPackage B}
    {U : PosteriorUpdatePackage P L} (E : BayesianEvidencePackage U) where
  evidenceComputedClosed : E.evidenceComputed
  evidencePositiveClosed : E.evidencePositive

def BayesianEvidenceClosed {B : BayesianAdmissibleObject}
    {P : PriorDistributionPackage B} {L : LikelihoodFunctionPackage B}
    {U : PosteriorUpdatePackage P L} (E : BayesianEvidencePackage U) : Prop :=
  E.evidenceComputed ∧ E.evidencePositive

theorem bayesian_evidence_closed_from_evidence
    {B : BayesianAdmissibleObject} {P : PriorDistributionPackage B}
    {L : LikelihoodFunctionPackage B} {U : PosteriorUpdatePackage P L}
    (E : BayesianEvidencePackage U) (Ev : BayesianEvidenceEvidence E) :
    BayesianEvidenceClosed E := by
  exact And.intro Ev.evidenceComputedClosed Ev.evidencePositiveClosed

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse