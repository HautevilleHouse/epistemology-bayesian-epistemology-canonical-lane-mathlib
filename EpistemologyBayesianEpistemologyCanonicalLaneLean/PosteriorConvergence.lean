import EpistemologyBayesianEpistemologyCanonicalLaneLean.BayesianInference

namespace HautevilleHouse
namespace EpistemologyBayesianEpistemologyCanonicalLaneLean

structure PosteriorConvergencePackage {M : BayesianModel}
    (Inf : BayesianInferencePackage M) where
  consistencyPosterior : Prop
  asymptoticNormality : Prop
  bernsteinVonMises : Prop

structure PosteriorConvergenceEvidence {M : BayesianModel}
    {Inf : BayesianInferencePackage M} (P : PosteriorConvergencePackage Inf) where
  consistencyPosteriorClosed : P.consistencyPosterior
  asymptoticNormalityClosed : P.asymptoticNormality
  bernsteinVonMisesClosed : P.bernsteinVonMises

def PosteriorConvergenceClosed {M : BayesianModel}
    {Inf : BayesianInferencePackage M} (P : PosteriorConvergencePackage Inf) : Prop :=
  P.consistencyPosterior ∧ P.asymptoticNormality ∧ P.bernsteinVonMises

theorem posterior_convergence_closed_from_evidence
    {M : BayesianModel} {Inf : BayesianInferencePackage M}
    (P : PosteriorConvergencePackage Inf)
    (E : PosteriorConvergenceEvidence P) : PosteriorConvergenceClosed P := by
  exact And.intro E.consistencyPosteriorClosed
    (And.intro E.asymptoticNormalityClosed E.bernsteinVonMisesClosed)

end EpistemologyBayesianEpistemologyCanonicalLaneLean
end HautevilleHouse